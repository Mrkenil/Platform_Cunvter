import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../provider/global_provider.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Image_picer"),
        trailing: CupertinoSwitch(
          value: Provider.of<global_pro>(context, listen: false).isIos,
          onChanged: (val) {
            Provider.of<global_pro>(context, listen: false)
                .plyform_cunvert(val);
          },
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              foregroundImage:
                  (Provider.of<global_pro>(context, listen: false).imag != null)
                      ? FileImage(
                          Provider.of<global_pro>(context, listen: true).imag!)
                      : null,
            ),
            ElevatedButton(
                onPressed: () async {
                  image = await picker.pickImage(source: ImageSource.camera)
                      as XFile;
                  Provider.of<global_pro>(context, listen: false)
                      .image_piker(File(image!.path));
                },
                child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
