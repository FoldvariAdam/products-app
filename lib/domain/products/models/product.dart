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

  const Product({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.stock,
    this.thumbnail,
  });

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
  ];
}