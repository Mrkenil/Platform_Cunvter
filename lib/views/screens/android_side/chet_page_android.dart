import 'package:flutter/material.dart';
import 'package:platform_cunvter/provider/global_provider.dart';
import 'package:provider/provider.dart';

class chat_page extends StatefulWidget {
  const chat_page({super.key});

  @override
  State<chat_page> createState() => _chat_pageState();
}

class _chat_pageState extends State<chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: Provider.of<global_pro>(context).countect.length,
          itemBuilder: (BuildContext, i) => ListTile(
            leading: CircleAvatar(
              radius: 30,
              foregroundImage: (Provider.of<global_pro>(context, listen: false)
                          .countect[i]
                          .image !=
                      null)
                  ? FileImage(Provider.of<global_pro>(context, listen: true)
                      .countect[i]
                      .image!)
                  : null,
            ),
            title: Text(Provider.of<global_pro>(context).countect[i].name),
            trailing: Text(
                "${Provider.of<global_pro>(context).countect[i].date.day.toString()}/${Provider.of<global_pro>(context).countect[i].date.month.toString()}/${Provider.of<global_pro>(context).countect[i].date.year.toString()},${Provider.of<global_pro>(context).countect[i].time.hour.toString()}:${Provider.of<global_pro>(context).countect[i].time.minute.toString()}"),
          ),
        ),
      ),
    );
  }
}
