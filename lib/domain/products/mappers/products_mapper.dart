import 'package:products_app/data/data_sources/remote/products/models/models.dart';
import 'package:products_app/domain/products/models/models.dart';

extension ProductsResponseMapper on ProductsResponse {
  List<Product> toDomainList(Set<int> favorites) {
    return products?.map((e) => e.toDomainModel(favorites)).toList() ?? [];
  }
}

extension ProductResponseMapper on ProductResponse {
  Product toDomainModel(Set<int> favorites) {
    return Product(
      id: id!,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      stock: stock,
      thumbnail: thumbnail,
      isFavorite: favorites.contains(id),
    );
  }
}
