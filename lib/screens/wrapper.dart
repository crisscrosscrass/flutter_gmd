import 'package:flutter/material.dart';
import 'package:gmd/models/user.dart';
import 'package:gmd/screens/auth/auth.dart';
import 'package:gmd/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user == null ? Authenticate() : Home();
  }
}
