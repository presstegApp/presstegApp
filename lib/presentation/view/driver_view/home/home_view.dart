import 'package:flutter/material.dart';

import 'drawer_view.dart';
import 'layout/body.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class DriverHomeView extends StatelessWidget {
  DriverHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: DriverHomeBody(),
      drawer: const DrawerView(),
    );
  }
}
