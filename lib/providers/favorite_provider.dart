import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import '../repositories/favorite_repository.dart';
import '../services/storage/storage.dart';
import 'repository_provider.dart';

part 'favorite_provider.g.dart';

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier {
  late final FavoriteRepository _favoriteRepository;
  late String _userId;
  List<Product> _favoriteProducts = [];

  @override
  Future<List<Product>> build() async {
    _userId = UserStorage.getUserId();
    _favoriteRepository = ref.read(favoriteServiceProvider);
    final data = await _favoriteRepository.getFavoriteProductsByUserId(_userId);
    _favoriteProducts = data;
    return data;
  }

  bool checkFavoriteProduct(int productId) {
    // Check if the product is already in favorites
    return _favoriteProducts.any((p) => p.productId == productId);
  }

  Future<void> addFavorite(Product newProduct) async {
    final bool isProductInFavorites = _favoriteProducts.any(
      (existingProduct) => existingProduct.productId == newProduct.productId,
    );

    if (!isProductInFavorites) {
      try {
        _favoriteProducts.add(newProduct);
        // FIXME: Need to improve in the future
        state = AsyncData(_favoriteProducts);
        await _favoriteRepository.insertFavorite(
          _userId,
          newProduct.productId!,
        );
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> removeFavorite(int productId) async {
    try {
      _favoriteProducts.removeWhere((item) => item.productId == productId);
      state = AsyncData(_favoriteProducts);
      await _favoriteRepository.removeFavorite(_userId, productId);
    } catch (e) {
      rethrow;
    }
  }
}
