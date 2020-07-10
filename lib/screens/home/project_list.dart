import 'package:flutter/material.dart';
import 'package:gmd/screens/home/project_tile.dart';
import 'package:provider/provider.dart';
import 'package:gmd/models/project.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<List<Project>>(context) ?? [];
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectTile(project: projects[index]);
      },
    );
  }
}
