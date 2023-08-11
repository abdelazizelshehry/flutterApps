// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import '../Screen/meal-datail.dart';
import '../models/meals.dart';

class mealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  mealItem(
      {
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
    }
  }

  String get affordableText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Priecy';
        break;
    }
  }
void _selcteMeal(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(mealDatail.routeName, arguments: id,).then((value) {
        if (value != null) {
       //   removeItem(value);
        }
      });
    }
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () =>_selcteMeal(context),
      child: Card(
        // to make the border of the card to be rounded RectangleBorder
        shape: RoundedRectangleBorder(
          // must take arguments like side and border radius
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            // stack take many widget above to each other 
            Stack(
              children: [
                // ClipRRect used for image to make the image to be rounded like acard as 
                // RoundedRectangler
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    // we give height to not overlappung the all screen 
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                // Positioned is Widget attached to Stack only and it's job to 
                // put your Widget in the place u want 
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordableText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
