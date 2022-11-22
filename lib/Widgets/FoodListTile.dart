import 'package:dialert/Constants/constants.dart';
import 'package:dialert/Utils/foodList.dart';
import 'package:flutter/material.dart';

class foodListTile extends StatefulWidget {
  int index;
  foodListTile({super.key, required this.index});

  @override
  State<foodListTile> createState() => _foodListTileState(index: index);
}

class _foodListTileState extends State<foodListTile> {
  int index;
  _foodListTileState({ required this.index});
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SizedBox(
      width: _size.width*0.8,
      child: Padding(
        padding:  const EdgeInsets.only(top:8.0, right: 8,left: 8),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade100,
            ),
            height: _size.height * 0.1,
            width: _size.width*0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(FoodList().foodList[index]["Food"], style: style5,),
            Text(FoodList().foodList[index]["Serving"], style: style5, maxLines: 1, softWrap: false,overflow: TextOverflow.ellipsis,),
            Text(FoodList().foodList[index]["Calories"], style: style5,maxLines: 1, softWrap: false,overflow: TextOverflow.ellipsis,)
            
            
            ],
            ),
          ),
        ),
      ),
    );
  }
}
