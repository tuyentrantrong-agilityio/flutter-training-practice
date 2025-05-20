import 'package:cached_query/cached_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
import '../const/const.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  late final ProductRepository _productRepository;
  late List<Product> _products;

  @override
  Future<List<Product>> build() async {
    _productRepository = ref.read(productServiceProvider);
    final data = await getCachedData();
    _products = data;
    return data;
  }

  Future<List<Product>> getCachedData() async {
    final query = Query<List<Product>>(
      key: "products",
      queryFn: () => _productRepository.getAllProducts(),
    );

    // Fetch the query result and return the data
    final queryState = await query.result;
    return queryState.data ?? [];
  }

  void filterProductsByCategory(int categoryId, String name) {
    if (name == AppConst.popular) {
      state = AsyncData(_products);
      return;
    }
    final products =
        _products.where((product) => product.categoryId == categoryId).toList();
    state = AsyncData(products);
  }

  Future<Product> getProductDetail(int id) async {
    final query = Query<Product>(
      key: "product-detail-$id",
      queryFn: () => _productRepository.getProductById(id),
    );

    // Fetch the query result and return the data
    final queryState = await query.result;
    return queryState.data!;
  }

  Future<Product> getProductById(int id) async {
    // Return the product if found
    return getProductDetail(id);
  }
}
