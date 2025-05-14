import '../models/product.dart';
import '../services/product_service.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _productService;

  ProductRepositoryImpl(this._productService);

  @override
  Future<List<Product>> getAllProducts() async {
    return _productService.getAllProduct();
  }

  @override
  Future<Product> getProductById(int id) async {
    return _productService.getProductById(id);
  }
}
