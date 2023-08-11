// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widget/catagory_item.dart';

class catagoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(20),
          children: DUMMY_CATEGORIES.map((Catdata) {
            return catagoryItem(Catdata.title, Catdata.color, Catdata.id);
          }).toList(),
          //Griddelgat it's about Structure of the catagorey items
          gridDelegate:
              // with MaxCross Axis means each item take whatever space it can take
              SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            // childAspectRario define the items what
            // should be sized regrading thier height and width ralation
            childAspectRatio: 3 / 2,
            //Cross and main spacing it's about space
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ));
  }
}
