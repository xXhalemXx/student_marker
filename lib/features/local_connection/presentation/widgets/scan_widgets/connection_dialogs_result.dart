import 'package:flutter/material.dart';
import 'package:student_marker/core/genral_use/constants.dart';
//attended
attendedDialog(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(AllTexts.success,style: TextStyle(color: AllColors.successColor),),
      content: const Text(AllTexts.attended),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text(AllTexts.ok))],
    );
  });
}
//already
alreadyAttendedDialog(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(AllTexts.warning,style: TextStyle(color: AllColors.orangeColor),),
      content: const Text(AllTexts.alreadyAttended),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text(AllTexts.ok))],
    );
  });
}
usingSameDeviceDialog(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(AllTexts.error,style: TextStyle(color: AllColors.failConnectionColor),),
      content: const Text(AllTexts.usingSameDevice),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text(AllTexts.ok))],
    );
  });
}
notRolledInDialog(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(AllTexts.error,style: TextStyle(color: AllColors.failConnectionColor),),
      content: const Text(AllTexts.notRolledIn),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text(AllTexts.ok))],
    );
  });
}

unknownResult(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: const Text(AllTexts.error,style: TextStyle(color: AllColors.orangeColor),),
      content: const Text(AllTexts.unknownResult),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      actions: [TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text(AllTexts.ok))],
    );
  });
}