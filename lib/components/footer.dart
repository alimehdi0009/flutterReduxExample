import 'package:flutter/material.dart';
import 'package:redux_todo_practice/models.dart';
import 'package:redux_todo_practice/container/footer_link.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FooterLink(text: 'All', visibility: TodoVisibility.SHOW_ALL),
          FooterLink(text: 'Active', visibility: TodoVisibility.SHOW_ACTIVE),
          FooterLink(
              text: 'Completed', visibility: TodoVisibility.SHOW_COMPLETED),
        ],
      ),
    );
  }
}
