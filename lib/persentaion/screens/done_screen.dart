// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/task.dart';

class DoneScreen extends StatelessWidget {
  List<Task> tasks;
  DoneScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tasks = tasks.where((element) => element.isDone == true).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].taskName),
          trailing: Text(
            DateFormat("dd/MM hh:mm").format(tasks[index].donetime!),
          ),
        );
      },
      itemCount: tasks.length,
    );
  }
}
