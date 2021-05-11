import 'package:flutter/material.dart';

class TodoForm extends StatelessWidget {
  final String title;
  final String desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;
  final VoidCallback onSaveTodo;

  const TodoForm(
      {Key key,
      this.title,
      this.desc,
      @required this.onChangedTitle,
      @required this.onChangedDesc,
      @required this.onSaveTodo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          initialValue: title,
          validator: (value) {
            if (value.isEmpty) {
              return "Title can't be empty";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Title",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2))),
        ),
        SizedBox(height: 10),
        TextFormField(
          initialValue: title,
          validator: (value) {
            if (value.isEmpty) {
              return "Title can't be empty";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: "Description",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2))),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 45,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text("Save",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
