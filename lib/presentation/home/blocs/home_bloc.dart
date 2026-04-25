import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:products_app/core/exceptions/base_exceptions.dart';
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
      } on AppException catch (e) {
        emit(HomeErrorState(e.message));
      } catch (_) {
        emit(const HomeErrorState('Unknown error'));
      }
    });
    on<HomeToggleFavoriteEvent>((event, emit) async {
      try {
        await _productsRepository.toggleFavorite(event.productId);

        final currentState = state;

        if (currentState is HomeLoadedState) {
          final updatedProducts = currentState.products.map((p) {
            if (p.id == event.productId) {
              return p.copyWith(isFavorite: !p.isFavorite);
            }
            return p;
          }).toList();

          emit(HomeLoadedState(updatedProducts, query: currentState.query));
        }
      } on AppException catch (e) {
        emit(HomeErrorState(e.message));
      } catch (_) {
        emit(const HomeErrorState('Unknown error'));
      }
    });
    on<HomeRefreshFavoritesEvent>((event, emit) async {
      final currentState = state;

      if (currentState is HomeLoadedState) {
        final favorites = await _productsRepository.getFavorites();

        final updated = currentState.products.map((p) {
          return p.copyWith(isFavorite: favorites.contains(p.id));
        }).toList();

        emit(HomeLoadedState(updated, query: currentState.query));
      }
    });
    on<HomeSearchChangedEvent>((event, emit) {
      final currentState = state;

      if (currentState is HomeLoadedState) {
        emit(HomeLoadedState(currentState.products, query: event.query));
      }
    });
  }
}
