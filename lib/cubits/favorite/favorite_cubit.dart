import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/remote/product_response.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState());

  void toggleFavorite(ProductResponse product) {
    final updatedFavorites = List<ProductResponse>.from(state.favorites);
    if (updatedFavorites.contains(product)) {
      updatedFavorites.remove(product);
    } else {
      updatedFavorites.add(product);
    }
    emit(FavoriteState(favorites: updatedFavorites));
  }
}
