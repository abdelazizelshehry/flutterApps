import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../Widget/meal_item.dart';
class Favourite extends StatelessWidget {
final List<Meal> _fav;
Favourite(this._fav);

  @override
  Widget build(BuildContext context) {
    return _fav.isEmpty ? Center(
      child: Text('No Favourite to Show Rightnow'),
    ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            id: _fav[index].id,
            title: _fav[index].title,
            imageUrl: _fav[index].imageUrl,
            duration: _fav[index].duration,
            complexity: _fav[index].complexity,
            affordability: _fav[index].affordability,
          );
        },
        itemCount: _fav.length,
      );
  }
}