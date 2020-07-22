import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final bool active;
  final VoidCallback onPressed;
  final String text;

  const Link({Key key, this.active, this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text.toString()),
      color: active ? Theme.of(context).primaryColor : null,
      onPressed: onPressed,
    );
  }
}
