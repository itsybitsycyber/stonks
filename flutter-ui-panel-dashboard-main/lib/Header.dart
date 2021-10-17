import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child:Image(image: AssetImage('stonks.png'), height: 150)),
          SizedBox(height: 5,),
          /* Center(
            child: Text("STONKS", style: TextStyle(color: Colors.white, fontSize: 40),),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text("Business Management Platform", style: TextStyle(color: Colors.white, fontSize: 18),),
          ),
          SizedBox(height: 10,)*/
        ],
      ),
    );
  }
}