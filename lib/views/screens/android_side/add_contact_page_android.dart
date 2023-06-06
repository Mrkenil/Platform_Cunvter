import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../provider/global_provider.dart';

class add_contect_android extends StatefulWidget {
  const add_contect_android({super.key});

  @override
  State<add_contect_android> createState() => _add_contect_androidState();
}

class _add_contect_androidState extends State<add_contect_android> {
  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController chatcontroller = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: contactFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage:
                        (Provider.of<global_pro>(context, listen: false).imag !=
                                null)
                            ? FileImage(
                                Provider.of<global_pro>(context, listen: true)
                                    .imag!)
                            : null,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.camera)
                          as XFile;
                      Provider.of<global_pro>(context, listen: false)
                          .image_piker(File(image!.path));
                    },
                    child: Icon(Icons.add),
                  ),
                  TextFormField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Full name",
                        label: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: numbercontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Number",
                        label: Icon(Icons.call)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: chatcontroller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "chat",
                        label: Icon(Icons.chat)),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          DateTime? pick_date = await showDatePicker(
                            context: context,
                            initialDate:
                                Provider.of<global_pro>(context, listen: false)
                                    .inDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );
                          Provider.of<global_pro>(context, listen: false)
                              .pike_date(pick_date!);
                        },
                        icon: Icon(Icons.calendar_month),
                      ),
                      Text(
                        "${Provider.of<global_pro>(context, listen: true).inDate!.day.toString()}/"
                        "${Provider.of<global_pro>(context, listen: true).inDate!.month.toString()}/"
                        "${Provider.of<global_pro>(context, listen: true).inDate!.year.toString()}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: Provider.of<global_pro>(context,
                                      listen: false)
                                  .Time);
                          Provider.of<global_pro>(context, listen: false)
                              .pike_time(time!);
                        },
                        icon: Icon(Icons.watch_outlined),
                      ),
                      Text(
                          "${Provider.of<global_pro>(context, listen: true).Time.hour} : "
                          "${Provider.of<global_pro>(context, listen: true).Time.minute}"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("save"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
