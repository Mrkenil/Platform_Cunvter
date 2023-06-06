import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/global_provider.dart';

class call_list_android extends StatefulWidget {
  const call_list_android({super.key});

  @override
  State<call_list_android> createState() => _call_list_androidState();
}

class _call_list_androidState extends State<call_list_android> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: Provider.of<global_pro>(context).countect.length,
          itemBuilder: (BuildContext, i) => ListTile(
              leading: CircleAvatar(
                radius: 30,
                foregroundImage:
                    (Provider.of<global_pro>(context, listen: false)
                                .countect[i]
                                .image !=
                            null)
                        ? FileImage(
                            Provider.of<global_pro>(context, listen: true)
                                .countect[i]
                                .image!)
                        : null,
              ),
              title: Text(Provider.of<global_pro>(context).countect[i].name),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              )),
        ),
      ),
    );
    ;
  }
}
