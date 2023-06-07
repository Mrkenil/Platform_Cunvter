import 'package:flutter/cupertino.dart';
import 'package:platform_cunvter/views/screens/ios_side/add_contect_page_ios.dart';
import 'package:platform_cunvter/views/screens/ios_side/call_page_ios.dart';
import 'package:platform_cunvter/views/screens/ios_side/chat_page_ios.dart';
import 'package:platform_cunvter/views/screens/ios_side/setting_page_ios.dart';

class IosPlatform extends StatefulWidget {
  const IosPlatform({Key? key}) : super(key: key);

  @override
  State<IosPlatform> createState() => _IosPlatformState();
}

class _IosPlatformState extends State<IosPlatform> {
  List<Widget> pages = [
    add_contect_ios(),
    chat_page_ios(),
    call_page_ios(),
    setting_page_ios(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Person"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: "Calls"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: "Settings"),
        ],
      ),
      tabBuilder: (context, index) => CupertinoTabView(
        builder: (BuildContext context) {
          return pages[index];
        },
      ),
    );
  }
}
