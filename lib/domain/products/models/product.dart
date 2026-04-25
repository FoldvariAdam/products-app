import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? rating;
  final int? stock;
  final String? thumbnail;

  final bool isFavorite;

  const Product({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.stock,
    this.thumbnail,
    this.isFavorite = false,
  });

  Product copyWith({bool? isFavorite}) {
    return Product(
      id: id,
      title: title,
      description: description,
      category: category,
      price: price,
      rating: rating,
      stock: stock,
      thumbnail: thumbnail,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    price,
    rating,
    stock,
    thumbnail,
    isFavorite,
  ];
}
