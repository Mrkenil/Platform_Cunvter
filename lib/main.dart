import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_cunvter/provider/global_provider.dart';
import 'package:platform_cunvter/views/screens/android_side/android_side.dart';
import 'package:platform_cunvter/views/screens/ios_side/home_page_ios.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => global_pro()),
      ],
      builder: (context, _) =>
          (Provider.of<global_pro>(context, listen: true).isIos)
              ? CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  home: app(),
                )
              : MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                  darkTheme: ThemeData.dark(
                    useMaterial3: true,
                  ),
                  themeMode: (!Provider.of<global_pro>(context).themeisdark)
                      ? ThemeMode.light
                      : ThemeMode.dark,
                  home: android_side_homepage(),
                ),
    ),
  );
}
