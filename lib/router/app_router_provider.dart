import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_router.dart';

final appRouterProvider = Provider.autoDispose((ref) => AppRouter());
