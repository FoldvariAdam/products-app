import 'package:products_app/data/data_sources/remote/products/models/models.dart';
import 'package:products_app/domain/products/models/models.dart';

extension ProductsResponseMapper on ProductsResponse {
  List<Product> toDomainList() {
    return products?.map((e) => e.toDomainModel()).toList() ?? [];
  }
}

extension ProductResponseMapper on ProductResponse {
  Product toDomainModel() {
    return Product(
      id: id!,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      stock: stock,
      thumbnail: thumbnail,
    );
  }
}
