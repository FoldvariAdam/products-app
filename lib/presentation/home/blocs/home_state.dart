part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

final class HomeLoadedState extends HomeState {
  final List<Product> products;
  final String query;

  const HomeLoadedState(this.products, {this.query = ''});

  @override
  List<Object?> get props => [products, query];
}

final class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
