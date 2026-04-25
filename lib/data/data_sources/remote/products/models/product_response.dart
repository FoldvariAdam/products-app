import 'package:json_annotation/json_annotation.dart';
import 'package:products_app/data/data_sources/remote/products/models/review_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  List<ProductResponse>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsResponse({this.products, this.total, this.skip, this.limit});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewResponse>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  ProductResponse({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.images,
    this.thumbnail,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}