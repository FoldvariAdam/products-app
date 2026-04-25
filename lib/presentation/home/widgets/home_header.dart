import 'package:flutter/material.dart';
import 'package:products_app/core/core.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Padding(
      padding: EdgeInsets.all(appTheme.s3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Termékkatalógus', style: appTheme.headLine),
          SizedBox(height: appTheme.s1),
          Text(
            'Böngészd a kínálatot és keress termékek között.',
            style: appTheme.subTitle,
          ),
          SizedBox(height: appTheme.s3),

          TextField(
            decoration: InputDecoration(
              hintText: 'Keresés...',
              prefixIcon: Icon(
                Icons.search,
                color: appTheme.mutedForegroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
