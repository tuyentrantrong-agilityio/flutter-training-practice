import '../models/category.dart';
import '../services/category_service.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _categoryService;

  CategoryRepositoryImpl(this._categoryService);

  @override
  Future<List<Category>> getAllCategories() async {
    return _categoryService.getAllCategory();
  }
}
