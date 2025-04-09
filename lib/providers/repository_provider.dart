import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/repository.dart';
import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../services/category_service.dart';
import '../services/favorite_service.dart';
import '../services/notification_service.dart';
import '../services/product_service.dart';
import '../services/profile_service.dart';

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

@Riverpod(keepAlive: true)
CategoryRepository categoryService(CategoryServiceRef ref) =>
    CategoryRepositoryImpl(CategoryService());

@Riverpod(keepAlive: true)
ProductRepository productService(ProductServiceRef ref) =>
    ProductRepositoryImpl(ProductService());
@Riverpod(keepAlive: true)
ProfileRepository profileService(ProfileServiceRef ref) =>
    ProfileRepositoryImpl(ProfileService());
