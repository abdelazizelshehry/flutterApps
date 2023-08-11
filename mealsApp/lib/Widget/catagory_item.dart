// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../Screen/catgory_meals_screen.dart';

class catagoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  catagoryItem(this.title, this.color, this.id);
  void _selectedCatagory(BuildContext ctx) {
    //Navigator when we want to go other screen in our app the app keep the old screen on the Stack

    Navigator.of(ctx)
    // we use pushed named here instead of push after we defined the route in the main.dart file
        .pushNamed(catagortyMeals.routeName, arguments: {'id': id, 'title': title});
    //MaterialPageRoute consist of builder which will render the Widget that we want to go
    // or to the screen we need matrialPageRoute to handle things about old page and new page
    // also exist CupertinoPageRoute for Ios
    // MaterialPageRoute(builder: (_) {
    //   return catagortyMeals(id, title);
    // },));
  }

  @override
  Widget build(BuildContext context) {
    // inkwell is like geaturedetector Widget but we add some styling here
    return InkWell(
      onTap: () => _selectedCatagory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
             //linear Gradiant dh 3bara 3n box bs ly 4kl mo3een
             // there are SweapGradient and RadialGradient we could use 
             // --> see Docs/dev/flutter
             gradient: LinearGradient(

                 colors: [color.withOpacity(.7), color],
            //     //begin and end de 7aga f elshape bs na m4 fahmaha
                 begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15)),
             ),
      );
  }
}
