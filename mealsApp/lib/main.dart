// ignore_for_file: prefer_const_constructors, void_checks

import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import '../Screen/filter_screen.dart';
import '../Screen/meal-datail.dart';
import '../Screen/tabs-screen.dart';
import '../Screen/catgory_meals_screen.dart';
import '../Screen/catagorys_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  // in this function we will check if the values come from filters.dart to our filter
  // and doing some logic of if else check to see if that meal exist in our new Filters 
  // or not 
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      // we pass the value we recieved to our Map (filters)
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        // we check here if the user selected GlutenFree and the meals which has 
        // the Gluten free and same logic for the rest of the filters 
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFav(String id) {
    // bos hena nta 3mlt aa 
    // 1- nta 7tet varable gwa elindex where 34an t4of aza kan mogod wla l2
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == id);
    // 2- lw tl3 mowgod yb2a h return index akbr mn el zero sa3tah ha3mlah remove mn 
    // elist 34an keda m3nah n el user 4alah mn el fav (Look meal-detail.dart [down lines])
    if (existingIndex >= 0) {
      setState(() {
              _favoriteMeals.removeAt(existingIndex);
      });
      // 3- lw m4 mwgood yb2a h return index -1 sa3tah hena m3na n el user 7atha f el fav
      // 34an keda 3ml add ll meal elly id bta3ha gay mn elmeal deatail 
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }
  // hena na 3mlt check 34an a4of aza kan eluser 3ml fav wla l2 
  // 34an 4kl el icon 
bool _isFav(String id) {
  return _favoriteMeals.any((element) => element.id == id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber.shade700,
        canvasColor: Color.fromRGBO(250, 250, 255, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                  // after importing the files of fonts in file.yaml
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(10, 20, 30, 1),
              ),
            ),
      ),
      //  home: tabsScreen(),
      // here we introduce another Route(page) of Our App
      // bs m4 naf3a ma3ya
      initialRoute: '/', //'/' is the defualt route
      routes: {
        //'/': (ctx) => catagoryScreen(),
        '/': (ctx) => tabsScreen(_favoriteMeals),
        catagortyMeals.routeName: (ctx) => catagortyMeals(_availableMeals),
        mealDatail.routeName: (ctx) => mealDatail(_toggleFav, _isFav),
        Filter_switch.routeName: (ctx) => Filter_switch(_setFilters, _filters),
      },
    );
  }
}
