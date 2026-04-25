part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeFetchProductsEvent extends HomeEvent {
  const HomeFetchProductsEvent();
}

final class HomeToggleFavoriteEvent extends HomeEvent {
  final int productId;

  const HomeToggleFavoriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

final class HomeRefreshFavoritesEvent extends HomeEvent {
  const HomeRefreshFavoritesEvent();
}

final class HomeSearchChangedEvent extends HomeEvent {
  final String query;

  const HomeSearchChangedEvent(this.query);

  @override
  List<Object?> get props => [query];
}