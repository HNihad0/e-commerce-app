import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/favorite/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Products")),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return Center(child: Text("No favorite products yet"));
          }
          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final product = state.favorites[index];
              return ListTile(
                leading: Image.network(product.image ?? ""),
                title: Text(product.title ?? ""),
                subtitle: Text("\$${product.price}"),
              );
            },
          );
        },
      ),
    );
  }
}
