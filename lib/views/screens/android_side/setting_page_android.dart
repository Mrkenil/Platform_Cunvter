import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_cunvter/provider/global_provider.dart';
import 'package:provider/provider.dart';

class setting_page_android extends StatefulWidget {
  const setting_page_android({super.key});

  @override
  State<setting_page_android> createState() => _setting_page_androidState();
}

class _setting_page_androidState extends State<setting_page_android> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            subtitle: Text("Edit profile"),
            trailing: Switch(
              onChanged: (n) {
                Provider.of<global_pro>(context, listen: false).onProfile(n);
              },
              value: Provider.of<global_pro>(context, listen: true).profile,
            ),
          ),
          (!Provider.of<global_pro>(context).profile)
              ? Divider()
              : Container(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage:
                                (Provider.of<global_pro>(context, listen: false)
                                            .profileImage !=
                                        null)
                                    ? FileImage(Provider.of<global_pro>(context,
                                            listen: true)
                                        .profileImage!)
                                    : null,
                          ),
                          (Provider.of<global_pro>(context, listen: false)
                                      .imag !=
                                  null)
                              ? GestureDetector(
                                  onTap: () async {
                                    image = await picker.pickImage(
                                        source: ImageSource.camera) as XFile;
                                    Provider.of<global_pro>(context,
                                            listen: false)
                                        .image_piker(File(image!.path));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey.withOpacity(0),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    image = await picker.pickImage(
                                        source: ImageSource.camera) as XFile;
                                    Provider.of<global_pro>(context,
                                            listen: false)
                                        .image_piker(File(image!.path));
                                  },
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 30,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text("Theme"),
            subtitle: Text("Chenge Theme"),
            trailing: Switch(
              onChanged: (n) {
                Provider.of<global_pro>(context, listen: false).chengeTheme(n);
              },
              value: Provider.of<global_pro>(context, listen: true).themeisdark,
            ),
          ),
        ],
      ),
    );
  }
}
