import 'package:cached_query/cached_query.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'const/const.dart';
import 'l10n/app_localizations.dart';
import 'router/app_router_provider.dart';
import 'theme/theme.dart';

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
