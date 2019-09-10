import 'package:flutter/material.dart';



// It prevent subtree from receiving pointer events by terminating hit testing at itself
class AbsorbPointerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: GestureDetector(
        onTap: (){
          debugPrint("OnButtonCliked");
        },
        child: Text("Click on me"),
      ),
    );
  }
}
