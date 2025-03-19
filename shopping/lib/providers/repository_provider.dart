import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/auth_repository.dart';
import '../repositories/cart_repository.dart';
import '../repositories/favorite_repository.dart';
import '../repositories/notification_repository.dart';
import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../services/favorite_service.dart';
import '../services/notification_service.dart';

part 'repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authService(AuthServiceRef ref) =>
    AuthRepositoryImpl(AuthService());

@Riverpod(keepAlive: true)
FavoriteRepository favoriteService(FavoriteServiceRef ref) =>
    FavoriteRepositoryImpl(FavoriteService());

@Riverpod(keepAlive: true)
CartRepository cartService(CartServiceRef ref) =>
    CartRepositoryImpl(CartService());

@Riverpod(keepAlive: true)
NotificationRepository notificationService(NotificationServiceRef ref) =>
    NotificationRepositoryImpl(NotificationService());
