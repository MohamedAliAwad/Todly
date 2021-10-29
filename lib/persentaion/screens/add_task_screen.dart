// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final String routeName = "AddTask";
  AddTaskScreen({Key? key}) : super(key: key);
  TextEditingController taskNameConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: taskNameConroller,
                onEditingComplete: () {
                  if (taskNameConroller.text != "") {
                    Navigator.of(context).pop(taskNameConroller.text);
                  }
                },
                //  onChanged: (val){

                // },
                decoration: InputDecoration(
                  hintText: "Enter Task Name",
                  label: Text("Task Name"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (taskNameConroller.text != "") {
                    Navigator.of(context).pop(taskNameConroller.text);
                  }
                },
                child: Text("Add Task")),
          ],
        ),
      ),
    );
  }
}
