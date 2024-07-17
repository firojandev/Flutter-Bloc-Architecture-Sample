import 'package:edcr_sup_flutter/common/utils/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/utils/my_colors.dart';
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
    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: MyColors.backgroundLight, // Your background color
          ),
          child: const Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 50, top: 50),
                child: Row(
                  children: [
                    Text(
                      "Sample App",
                      style: MyTextStyle.titleStyle,
                    ),
                    Spacer(),
                    Text(
                      "17 July, 2024",
                      style: MyTextStyle.titleStyle,
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("data"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("0",style: TextStyle(fontSize: 20),),
                            Text("Title",style: MyTextStyle.textStyle,),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text("data2 ",style: MyTextStyle.textStyle,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
