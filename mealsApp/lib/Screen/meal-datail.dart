// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class mealDatail extends StatelessWidget {
  static const routeName = '/meal-datial';
  final Function _toogle;
  final Function _isFav;
  mealDatail(this._toogle, this._isFav);
  Widget _BuildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal =
        //firstwhere means when you get the id or the photo selected to be spacific in the
        // mealList item you return the first element u find in case of the id of meal
        // selcted = to the id in the mealLIst
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detial'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Image.network(
              selectedmeal.imageUrl,
              fit: BoxFit.cover,
            ),
            height: 300,
            width: double.infinity,
          ),
          Container(
            child: Text(
              'ingradiants',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          _BuildContainer(
            ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                    child: Text(
                      selectedmeal.ingredients[index],
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
              ),
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          _BuildContainer(
            ListView.builder(
              itemCount: selectedmeal.steps.length,
              itemBuilder: (ctx, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    selectedmeal.steps[index],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
              ]),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFav(mealId) ? Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
        ) : Icon(Icons.star_border),
        onPressed: () => _toogle(mealId)
       //   Navigator.of(context).pop(mealId);
        ,
      ),
    );
  }
}
