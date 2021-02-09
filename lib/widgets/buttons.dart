
import 'package:dro_health_app/utils/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String title;
  final Function onTap;
  final Color color;
  final IconData icon;
  final Color textColor;

  Button({this.title, this.onTap, this.color, this.icon , this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color ?? DroColor.DROPurple,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Center(
        child: Row(
          children: [
            Icon(icon),
            Text(title,style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 
            ),)
          ],
        ),
      ),
    );
  }
}