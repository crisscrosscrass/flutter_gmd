import 'package:flutter/material.dart';
import 'package:gmd/models/project.dart';
import 'package:gmd/screens/home/addings_form.dart';
import 'package:gmd/screens/home/project_list.dart';
import 'package:gmd/screens/home/settings_form.dart';
import 'package:gmd/services/auth.dart';
import 'package:gmd/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    void _showAddUserPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return AddingsForm();
          });
    }

    return StreamProvider<List<Project>>.value(
      value: DatabaseService().projects,
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('GMD Todo'),
          backgroundColor: Colors.blue[800],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () => _showAddUserPanel(),
                icon: Icon(Icons.person_add),
                label: Text('Add')),
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.SignOut();
              },
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings')),
          ],
        ),
        body: ProjectList(),
      ),
    );
  }
}
