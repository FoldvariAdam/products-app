import 'package:injectable/injectable.dart';
import 'package:products_app/data/data.dart';

@lazySingleton
class ToggleFavoriteUseCase {
  final ProductsRepository _productsRepository;

  ToggleFavoriteUseCase(this._productsRepository);

  Future<void> execute(int id) async {
    await _productsRepository.toggleFavorite(id);
  }
}
