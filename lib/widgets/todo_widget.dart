import 'package:fitness_app/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        actions: [
          IconSlideAction(
            icon: Icons.edit,
            color: Colors.green,
            onTap: () {},
            caption: "Edit",
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.redAccent,
            onTap: () {},
            caption: "Delete",
          ),
        ],
        child: todoTile(context),
      ),
    );
  }

  Widget todoTile(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              onChanged: (_) {},
              value: todo.isDone,
              checkColor: Colors.white,
              activeColor: Colors.pink,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: 22,
                    ),
                  ),
                  if (todo.desc.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.desc,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            )
          ],
        ));
  }
}
