
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ConnectionHeader extends StatelessWidget {
  final Color textColor;
  final String headerText;
  const ConnectionHeader({Key? key,required this.headerText,required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.14,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025,right: 3,left: 3),
          child: AutoSizeText(
            headerText,
            style:  TextStyle(
              color: textColor,
              fontFamily: 'RubikDistressed',
              fontSize: 50,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
