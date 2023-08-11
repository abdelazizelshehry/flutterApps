
import 'package:flutter/material.dart';
import '../Widget/drawer.dart';

class Filter_switch extends StatefulWidget {
  static const routeName = '/Filters';
  // we recieve here our function from main.dart file 
  final Function updateFilter;
  final Map<String, dynamic> currentFilter;
  Filter_switch(this.updateFilter, this.currentFilter);

  @override
  State<Filter_switch> createState() => _Filter_switchState();
}

class _Filter_switchState extends State<Filter_switch> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
 @override
 // we put this value in initstate to be uptodate with the user selected 
 // we pass the bool value which we are recieved from currentFilter Map to our 
 // bool variable 
 void initState() {
        isGlutenFree = widget.currentFilter['gluten'];
        isLactoseFree = widget.currentFilter['lactose'];
        isVegan = widget.currentFilter['vegan'];
        isVegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // here we assign our values of Bool of our filters 
                final selectedFilter = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian,
                };
                // and here we pass our selectedFilter to our Function to Check Logic 
                // un main.dart 
                widget.updateFilter(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
        title: (Text('Filters')),
      ),

      // we use our drawer from Drawer_Main() Widget 
      drawer: Drawer_Main(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Adjust Your meals',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
          ),
          Expanded(
              child: ListView(
            children: [
              // SwitchListTile is switch but has some features to add like title and subtitle
              // also take onChanged Function to do some logic when the user selected afilter
              SwitchListTile(
                  title: Text('GlutenFree'),
                  subtitle: Text('only include GlutenFree meals'),
                  value: isGlutenFree,
                  onChanged: (value) {
                    setState(() {
                        isGlutenFree = value;
                      });
                  }),
              SwitchListTile(
                  title: Text('LactoseFree'),
                  subtitle: Text('only include LactoseFree meals'),
                  value: isLactoseFree,
                  onChanged: (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('only include veganFree meals'),
                  value: isVegan,
                  onChanged: (value) {
                    setState(() {
                      isVegan = value;
                    });
                  }),
              SwitchListTile(
                  title: Text('VegetarianFree'),
                  subtitle: Text('only include VegetarianFree meals'),
                  value: isVegetarian,
                  onChanged: (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
