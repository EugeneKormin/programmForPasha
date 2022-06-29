import 'package:flutter/material.dart';


class NavigationButton extends StatelessWidget {
    final String route;
    final double margin_from_top;
    final String button_name;

  const NavigationButton({
    Key? key,
    required this.route,
    required this.margin_from_top,
    required this.button_name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, margin_from_top, 0, 0),
        child: ElevatedButton(
          onPressed: () {
              Navigator.pushNamed(context, route);
          },
        child: Text(button_name))
    );
  }
}
