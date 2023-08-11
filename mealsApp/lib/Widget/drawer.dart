// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, void_checks, unused_import



import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Screen/tabs-screen.dart';
import '../Screen/filter_screen.dart';

class Drawer_Main extends StatelessWidget {
    void selctedChosse(BuildContext ctx, String Name) {
      // Replacement named that will remove or delted the current Route from the stack 
      // if you cancel the drawer in FilierScreen after that u will notice there is no back 
      // if u entered that route because using pushReplacementNamed
     Navigator.of(ctx).pushReplacementNamed(Name);
  }
  @override
  Widget _buildListTile(String title, IconData ic, BuildContext context, String name) {
   
    return ListTile(
            leading: Icon(ic),
            title: Text(
              title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            onTap: () => selctedChosse(context, name),
          );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor),
            ),
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          _buildListTile('Meals', Icons.restaurant,context, '/')
           ,
          _buildListTile('Filters', Icons.settings, context, Filter_switch.routeName)
          
        ],
      ),
    );
  }
}
