import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_cunvter/modals/contect_modal.dart';
import 'package:platform_cunvter/provider/global_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/countroler.dart';

class add_contect_ios extends StatefulWidget {
  const add_contect_ios({Key? key}) : super(key: key);

  @override
  State<add_contect_ios> createState() => _add_contect_iosState();
}

class _add_contect_iosState extends State<add_contect_ios> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          width: w,
          child: Column(
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              SizedBox(
                height: h * 0.15,
                width: w,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: h * 0.2,
                            color: Colors.blueGrey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    image = await picker.pickImage(
                                        source: ImageSource.camera);
                                    Provider.of<global_pro>(context,
                                            listen: false)
                                        .image_piker(File(image!.path));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.camera_alt_sharp),
                                      Text("Camara"),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    XFile? imageXfile = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    Provider.of<global_pro>(context,
                                            listen: false)
                                        .image_piker(File(image!.path));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(Icons.folder),
                                      Text("File"),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    foregroundImage:
                        (Provider.of<global_pro>(context, listen: false).imag !=
                                null)
                            ? FileImage(
                                Provider.of<global_pro>(context, listen: true)
                                    .imag!)
                            : null,
                    child: Icon(
                      Icons.camera_alt,
                      size: 60,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: contactFormKey,
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //full Name

                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.person),
                                CupertinoTextFormFieldRow(
                                  controller: namecontroller,
                                  textInputAction: TextInputAction.next,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "  Enter your Full Name...";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.phone),
                                CupertinoTextFormFieldRow(
                                  controller: numbercontroller,
                                  textInputAction: TextInputAction.next,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter your Contact No. Please...";
                                    } else if (val.length != 10) {
                                      return "Enter a Valid Contact No.";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.chat_bubble_2),
                                CupertinoTextFormFieldRow(
                                  controller: chatcontroller,
                                  textInputAction: TextInputAction.done,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter your Email...";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.date_range_outlined),
                    onPressed: () async {
                      DateTime? PickedDate = await showDatePicker(
                        context: context,
                        initialDate:
                            Provider.of<global_pro>(context, listen: false)
                                .inDate!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      );
                      Provider.of<global_pro>(context, listen: false)
                          .pike_date(PickedDate!);
                    },
                  ),
                  Text(
                      "${Provider.of<global_pro>(context).inDate!.day}/${Provider.of<global_pro>(context).inDate!.month}/${Provider.of<global_pro>(context).inDate!.year}"),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      TimeOfDay? PickedTime = await showTimePicker(
                        context: context,
                        initialTime:
                            Provider.of<global_pro>(context, listen: false)
                                .Time,
                      );
                      Provider.of<global_pro>(context, listen: false)
                          .pike_time(PickedTime!);
                    },
                  ),
                  Text(
                      "${Provider.of<global_pro>(context).Time.hour}:${Provider.of<global_pro>(context).Time.minute}"),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (contactFormKey.currentState!.validate()) {
                    cuntect c1 = cuntect(
                        image: Provider.of<global_pro>(context, listen: false)
                            .imag!,
                        name: namecontroller.text,
                        number: numbercontroller.text,
                        chat: chatcontroller.text,
                        date: Provider.of<global_pro>(context, listen: false)
                            .inDate!,
                        time: Provider.of<global_pro>(context, listen: false)
                            .Time);
                    Provider.of<global_pro>(context, listen: false)
                        .add_contect(c1);
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
