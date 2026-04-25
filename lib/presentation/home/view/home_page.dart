import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/core/themes/app_theme_factory.dart';
import 'package:products_app/domain/products/models/product.dart';
import 'package:products_app/presentation/home/blocs/home_bloc.dart';
import 'package:products_app/presentation/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return BlocProvider(
      create: (_) =>
      GetIt.instance.get<HomeBloc>()..add(const HomeFetchProductsEvent()),
      child: Scaffold(
        backgroundColor: appTheme.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return switch (state) {
                      HomeLoadingState() => const _LoadingView(),
                      HomeErrorState(:final message) =>
                          _ErrorView(message: message),
                      HomeLoadedState(:final products) =>
                          _ListView(products: products),
                      _ => const SizedBox(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Product> products;

  const _ListView({required this.products});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: appTheme.s3),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(appTheme.s3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: appTheme.primaryColor),
            SizedBox(height: appTheme.s2),
            Text(message, style: appTheme.bodyText, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}