import 'package:app_links/app_links.dart';
import 'package:cached_query/cached_query.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'const/const.dart';
import 'l10n/app_localizations.dart';
import 'router/app_router.gr.dart';
import 'router/app_router_provider.dart';
import 'theme/theme.dart';

/// StreamProvider để lắng nghe các Deep Links
final deepLinkProvider = StreamProvider<Uri>((ref) {
  final appLinks = AppLinks();

  // Lắng nghe các liên kết sâu qua uriLinkStream
  final stream = appLinks.uriLinkStream;

  // Khi provider bị hủy, hủy luôn stream subscription
  ref.onDispose(() {
    stream.listen(null).cancel();
  });

  return stream;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  CachedQuery.instance.config(
    config: QueryConfig(
      refetchDuration: const Duration(minutes: 1),
      cacheDuration: const Duration(minutes: 5),
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    // Listen to deep links
    ref.listen<AsyncValue<Uri>>(deepLinkProvider, (previous, next) {
      next.whenData((uri) {
        if (uri.path == 'shopping.dynalinks.app/products/5') {
          appRouter.push(const CartRoute());
        } else if (uri.path == '/cart') {
          appRouter.push(const CartRoute());
        }
        // Add more paths if needed
      });
    });
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConst.appName,
      routerDelegate: appRouter.delegate(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: AppThemes.lightThemeData,
    );
  }
}
