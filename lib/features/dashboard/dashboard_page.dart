import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/custom_app_bar.dart';

//
// appBar: CustomAppBar(
// leading: IconButton(
// icon: Icon(Icons.arrow_back),
// onPressed: () {
// context.goNamed(
// RoutePath.login,
// );
// },
// ),
// title: "Dashboard"),

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Dashboard"),
      body: Center(child: Text("Dashboard")),
    );
  }
}
