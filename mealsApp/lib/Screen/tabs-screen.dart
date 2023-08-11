// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables




import 'package:flutter/material.dart';
import '../Screen/catagorys_screen.dart';
import '../Screen/favourite.dart';
import '../Widget/drawer.dart';
import '../models/meals.dart';
// Test-screen is for me to understand how we render multiple widget in the bottom screen 
// of the app 
//import '../Screen/test-screen.dart';

class tabsScreen extends StatefulWidget {
  final List<Meal> _favourite;
  tabsScreen(this._favourite);
  @override
  __tabsScreenState createState() => __tabsScreenState();
}

class __tabsScreenState extends State<tabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int selctedBarIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': catagoryScreen(), 'title': 'Meals'},
      {'page': Favourite(widget._favourite), 'title': 'Your Favourite'},
     // {'page': test(), 'title': 'Test'}
    ];
    super.initState();
  }

  void _selectedBar(int index) {
    setState(() {
      selctedBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DefaultTabController allows to us to add AppBars using Scaffold as child
    // and give it lenght which mean how many tabs will be included in this tab
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       // bottom to put the items of the tabbar to be in the bottom of the tab
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(icon: Icon(Icons.category),text: 'Categories',),
    //           Tab(icon: Icon(Icons.star),text: 'Favourite',)
    //         ],
    //       ),
    //     ),
    //     // body must take the Widget of our Tabbar and must to be in sequence of the icon
    //     // of the tabbar
    //     body: TabBarView(children: [
    //       catagoryScreen(),
    //       Favourite(),
    //     ],),
    //   ),
    // );
    // instead of using this method of creating our tabBar we could use another method
    // and that should be taken
    return Scaffold(
      drawer: Drawer_Main(),
      appBar: AppBar(
        title: Text(_pages[selctedBarIndex]['title']),
      ),
      body: _pages[selctedBarIndex]['page'],
      // We use bottomNavigationBar to add downBar in our app on tap we excute the function
      // that should render the number of the index of the page
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedBar,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selctedBarIndex,
        //  type: BottomNavigationBarType.shifting,
        // in items we pass a list with our icon
        items: [
          BottomNavigationBarItem(
              //  backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              //  backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Your Favourite')),
        //  BottomNavigationBarItem(
          //    icon: Icon(Icons.add), title: Text('Your Test'))
        ],
      ),
    );
  }
}
