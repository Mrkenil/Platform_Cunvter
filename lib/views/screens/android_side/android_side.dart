import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_cunvter/provider/global_provider.dart';
import 'package:platform_cunvter/views/screens/android_side/add_contact_page_android.dart';
import 'package:platform_cunvter/views/screens/android_side/call_list_android.dart';
import 'package:platform_cunvter/views/screens/android_side/chet_page_android.dart';
import 'package:platform_cunvter/views/screens/android_side/setting_page_android.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class android_side_homepage extends StatefulWidget {
  const android_side_homepage({Key? key}) : super(key: key);

  @override
  State<android_side_homepage> createState() => _android_side_homepageState();
}

class _android_side_homepageState extends State<android_side_homepage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iamge_piker"),
        centerTitle: true,
        elevation: 2,
        actions: [
          Switch(
            value: Provider.of<global_pro>(
              context,
              listen: false,
            ).isIos,
            onChanged: (val) {
              Provider.of<global_pro>(
                context,
                listen: false,
              ).plyform_cunvert(val);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            Provider.of<global_pro>(context, listen: true).selected_page,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.cyan,
        onTap: (int index) {
          Provider.of<global_pro>(context, listen: false).chenge_page(index);
          pageController.animateToPage(
              Provider.of<global_pro>(context, listen: false).selected_page,
              duration: Duration(milliseconds: 400),
              curve: Curves.bounceInOut);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_add,
              ),
              label: "add"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "calls"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "setting"),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          Provider.of<global_pro>(context, listen: false).chenge_page(index);
        },
        children: [
          add_contect_android(),
          chat_page(),
          call_list_android(),
          setting_page_android(),
        ],
      ),
      // body: Center(
      //   child:
      // ),
    );
  }
}
