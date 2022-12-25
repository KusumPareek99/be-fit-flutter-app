
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:mini_project/constants/constants.dart';
import 'package:mini_project/service/auth_controller.dart';

class CustomAppBar extends StatelessWidget {
  late String email;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return  Padding(
      padding: EdgeInsets.only(left: 20.0,right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                ),
              )
            ],
         ),
          Row(
            children: [
              // Stack(
              //   children: [
              //     Icon(
              //       Icons.notifications_none_rounded,
              //       size: 30.0,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           color: primary,
              //           borderRadius: BorderRadius.circular(30.0)
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(4.0),
              //         child: Text('0',style: TextStyle(color: white,fontSize: 8),),
              //       ),
              //     )
              //   ],
              // ),
              Transform(
                transform: Matrix4.rotationY(math.pi),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // call function to view menu bar with options like [help,settings,about]
                  },
                  child: Icon(
                    Icons.sort_rounded,
                    size: 30.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
