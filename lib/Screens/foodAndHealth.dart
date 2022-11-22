
import 'package:dialert/Widgets/FoodListTile.dart';
import 'package:dialert/Widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';

import '../Utils/foodList.dart';

class foodAndHealth extends StatefulWidget {
  const foodAndHealth({super.key});

  @override
  State<foodAndHealth> createState() => _foodAndHealthState();
}

class _foodAndHealthState extends State<foodAndHealth> {
  TextEditingController _searchFood = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    Size _size = MediaQuery.of(context).size;
    return  ListView.builder(
          itemCount: FoodList().foodList.length,
          itemBuilder: (BuildContext context, int index) {
            return foodListTile(index:index);
          },
    );
    
  }
}
