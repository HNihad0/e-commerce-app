part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final List<ProductResponse> favorites;

  const FavoriteState({this.favorites = const []});

  @override
  List<Object> get props => [favorites];
}
