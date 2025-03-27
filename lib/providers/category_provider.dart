import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
import '../models/category.dart';
import '../repositories/category_repository.dart';

part 'category_provider.g.dart';

// StateProvider to store the active category ID
// Default is the "Popular" category with an ID of 8
final activeCategoryIdProvider = StateProvider<int?>((ref) => 8);

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  late final CategoryRepository _categoryRepository;

  @override
  Future<List<Category>> build() async {
    _categoryRepository = ref.read(categoryServiceProvider);
    return _categoryRepository.getAllCategories();
  }
}
