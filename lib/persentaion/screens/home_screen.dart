// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(taskName: "eat breakfast"),
    Task(taskName: "drink cofee"),
    Task(taskName: "morining training"),
    Task(taskName: "Go to Work"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var text =
                await Navigator.of(context).pushNamed("/add_task") as String;
            setState(() {
              tasks.add(Task(taskName: text));
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Organize your tasks"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "All Tasks",
              ),
              Tab(
                text: "To Do",
              ),
              Tab(
                text: "Done",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  tasks[index].taskName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        decoration: tasks[index].isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                ),
                trailing: Checkbox(
                  onChanged: (val) {
                    setState(() {
                      tasks[index].isDone = val!;
                      if (tasks[index].isDone) {
                        tasks[index].donetime == DateTime.now();
                      }
                    });
                  },
                  value: tasks[index].isDone,
                ),
              );
            },
            itemCount: tasks.length,
            /* ListView(
              children: tasks
                  .map(
                    (elemnt) => ListTile(
                      title: Text(elemnt.taskName),
                      trailing: Checkbox(
                        onChanged: (val) {
                          setState(() {
                            elemnt.isDone = val!;
                          });
                        },
                        value: elemnt.isDone,
                      ),
                    ),
                  )
                  .toList()),*/
          ),
          ToDoScreen(),
          DoneScreen(
            tasks: tasks,
          ),
        ]),
      ),
    );
  }
}
