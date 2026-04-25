import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:products_app/presentation/home/blocs/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetIt.instance.get<HomeBloc>()
        ..add(const HomeFetchProductsEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return const Text('Home page');
        },
      ),
    );
  }
}
