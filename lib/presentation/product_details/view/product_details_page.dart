import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/core/core.dart';
import 'package:products_app/domain/products/models/product.dart';
import 'package:products_app/domain/products/use_cases/toggle_favorite_use_case.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ToggleFavoriteUseCase _toggleFavoriteUseCase = GetIt.instance
      .get<ToggleFavoriteUseCase>();

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final product = widget.product;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appTheme.componentBackgroundColor,
                ),
                child: product.thumbnail != null
                    ? Image.network(product.thumbnail!, fit: BoxFit.cover)
                    : Icon(
                        Icons.image,
                        size: 80,
                        color: appTheme.mutedForegroundColor,
                      ),
              ),

              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                    onPressed: () => NavigationService.of(context).goBack(isFavorite)
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(appTheme.s3),
              decoration: BoxDecoration(
                color: appTheme.backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(appTheme.r2xl.topLeft.x),
                ),
              ),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: appTheme.s1,
                      vertical: appTheme.s0,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.secondaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      product.category ?? '',
                      style: appTheme.descriptionText.copyWith(
                        color: appTheme.primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: appTheme.s2),

                  Text(product.title ?? '', style: appTheme.headLine),

                  SizedBox(height: appTheme.s1),

                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      SizedBox(width: appTheme.s0),
                      Text('${product.rating ?? '-'}'),
                      SizedBox(width: appTheme.s3),
                      Text('Stock: ${product.stock ?? '-'}'),
                    ],
                  ),

                  SizedBox(height: appTheme.s3),

                  Text(
                    '${product.price?.toStringAsFixed(0) ?? '-'} Ft',
                    style: appTheme.headLine.copyWith(
                      color: appTheme.primaryColor,
                    ),
                  ),

                  SizedBox(height: appTheme.s3),

                  Text(
                    product.description ?? '',
                    style: appTheme.descriptionText.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(appTheme.s3),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              await _toggleFavoriteUseCase.execute(product.id);

              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Text(
              isFavorite ? 'Törlés a kedvencekből' : 'Hozzáadás a kedvencekhez',
            ),
          ),
        ),
      ),
    );
  }
}
