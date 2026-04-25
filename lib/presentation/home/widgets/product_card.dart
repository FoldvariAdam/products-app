import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/core.dart';
import 'package:products_app/domain/products/models/product.dart';
import 'package:products_app/presentation/home/blocs/home_bloc.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool get _isFavorite => widget.product.isFavorite;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return InkWell(
      onTap: () async {
        await NavigationService.of(
          context,
        ).goToDetailsPage(product: widget.product);

        if (context.mounted) {
          context.read<HomeBloc>().add(
            const HomeRefreshFavoritesEvent(),
          );
        }
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: appTheme.s2),
            padding: EdgeInsets.all(appTheme.s2),
            decoration: BoxDecoration(
              color: appTheme.componentBackgroundColor,
              borderRadius: appTheme.r2xl,
              border: Border.all(color: appTheme.borderColor),
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: appTheme.r2xl,
                    color: appTheme.backgroundColor,
                  ),
                  child: widget.product.thumbnail != null
                      ? ClipRRect(
                          borderRadius: appTheme.r2xl,
                          child: Image.network(
                            widget.product.thumbnail!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(Icons.image, color: appTheme.mutedForegroundColor),
                ),

                SizedBox(width: appTheme.s2),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: appTheme.s1,
                          vertical: appTheme.s0,
                        ),
                        decoration: BoxDecoration(
                          color: appTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: appTheme.borderColor),
                        ),
                        child: Text(
                          widget.product.category ?? '',
                          style: appTheme.descriptionText,
                        ),
                      ),

                      SizedBox(height: appTheme.s1),

                      Text(
                        widget.product.title ?? '',
                        style: appTheme.bodyText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: appTheme.s1),

                      Text(
                        widget.product.description ?? '',
                        style: appTheme.descriptionText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: appTheme.s2),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.product.price?.toStringAsFixed(0) ?? '-'} Ft',
                            style: appTheme.metaText,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 16,
                                color: appTheme.secondaryColor,
                              ),
                              SizedBox(width: appTheme.s0),
                              Text(
                                '${widget.product.rating ?? '-'}',
                                style: appTheme.metaText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                context.read<HomeBloc>().add(
                  HomeToggleFavoriteEvent(widget.product.id),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: _isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
