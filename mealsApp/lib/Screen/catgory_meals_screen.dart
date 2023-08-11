import '../models/meals.dart';

import '../Widget/meal_item.dart';

import 'package:flutter/material.dart';

class catagortyMeals extends StatefulWidget {
  static const routeName = '/catagory_meals';
  final List<Meal> _avaMeals;

  catagortyMeals(this._avaMeals);

  @override
  State<catagortyMeals> createState() => _catagortyMealsState();
}

class _catagortyMealsState extends State<catagortyMeals> {
  late String title;
  late List<Meal> category_Meals;

  var isIntialized = false;
  @override
  void didChangeDependencies() {
    if (!isIntialized) {
      final routeAegs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      title = routeAegs['title'].toString();
      final id = routeAegs['id'];
      category_Meals = widget._avaMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      isIntialized = true;
    }

    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      category_Meals.removeWhere((element) => mealId == element.id);
    });
  }
// // final String catagoryID;
// // final String title;
// catagortyMeals(this.catagoryID, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return mealItem(
            id: category_Meals[index].id,
            title: category_Meals[index].title,
            imageUrl: category_Meals[index].imageUrl,
            duration: category_Meals[index].duration,
            complexity: category_Meals[index].complexity,
            affordability: category_Meals[index].affordability,
          );
        },
        itemCount: category_Meals.length,
      ),
    );
  }
}
