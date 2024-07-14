part of 'history_bloc.dart';

@immutable
sealed class ItemsState extends Equatable {}

final class ItemsInitial extends ItemsState {
  @override
  List<Object?> get props => [];
}

final class ItemsLoaded extends ItemsState {
  final List<dynamic> products;
  final List<dynamic> stories;
  final List<dynamic> banners;

  ItemsLoaded({
    required this.products,
    required this.stories,
    required this.banners,
  });

  @override
  List<Object?> get props => [products, stories, banners];
}

final class ItemsLoading extends ItemsState {
  @override
  List<Object?> get props => [];
}

final class ItemsFailure extends ItemsState {
  @override
  List<Object?> get props => [];
}
