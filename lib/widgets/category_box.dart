  import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/restaurant_model.dart';
  
  class CategoryBox extends StatelessWidget {
    final Category category;

  const CategoryBox({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = Restaurant.restaurants
        .where((restaurant) => restaurant.tags.contains(category.name))
        .toList();
  return InkWell(
     onTap: () {
        Navigator.pushNamed(
          context,
          '/Resturant-Listing',
          arguments: restaurants,
        );
      },
    child: Container(
      width: 96,
      margin:EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: Colors.blueGrey
      ,borderRadius: BorderRadius.circular(5)
      ),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left:10,
          child: Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Image.asset(category.image),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8) ,
          child: Align(
            alignment: Alignment.bottomCenter ,
            
            child: Text(category.name)),
        )
  
      ],
    ),
    ),
  );
  }

  }