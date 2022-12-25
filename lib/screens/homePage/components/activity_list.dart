import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({super.key});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top:16.0),
      padding: EdgeInsets.all(10.0),
      height:h * 0.15,
      child: Card(
            child: Center(
              child: ListTile(
          
          leading: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
          ),
          title: Text("Steps counter"),
          subtitle: Text("0 count"),
          trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
          ),
        ),
            ),
      ),
    );
  }
}