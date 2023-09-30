import 'package:flutter/material.dart';
import 'package:student_marker/core/genral_use/constants.dart';
import 'package:student_marker/features/local_connection/presentation/widgets/genral_widgets/genral_widgets.dart';
class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ConnectionHeader(headerText: AllTexts.waiting,textColor: Colors.white,),
        SizedBox(height:MediaQuery.of(context).size.height*0.35,),
        const Center(child: CircularProgressIndicator(),),
      ],
    );
  }
}
