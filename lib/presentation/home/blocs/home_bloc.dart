import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/data/data.dart';
import 'package:products_app/domain/domain.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepository _productsRepository;

  HomeBloc(this._productsRepository) : super(HomeInitialState()) {
    on<HomeFetchProductsEvent>((event, emit) async {
      try {
        emit(const HomeLoadingState());

        final products = await _productsRepository.getProducts();

        emit(HomeLoadedState(products));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
