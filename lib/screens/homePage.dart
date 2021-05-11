import 'package:fitness_app/widgets/show_dialog_box.dart';
import 'package:fitness_app/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [TodoList(), Container()];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("To-do"), backgroundColor: Colors.pink),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
                selectedIndex = index;
              }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.today_outlined,
                size: 28,
              ),
              label: "Todos",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
                size: 28,
              ),
              label: "Completed",
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => ShowTodoDialogBox());
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
