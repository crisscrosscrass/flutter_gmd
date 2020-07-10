import 'package:flutter/material.dart';
import 'package:gmd/models/project.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  ProjectTile({this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink[project.strength],
            radius: 25,
          ),
          title: Text(project.name),
          subtitle: Text('Takes ${project.sugars} sugar(s).'),
        ),
      ),
    );
  }
}
