import 'package:bmi_demo/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
          child: Row(
        children: [
          Text('light mode'),
          Switch(
              value: Provider.of<ThemeProvider>(context).themeMode ==
                      ThemeMode.light
                  ? false
                  : true,
              onChanged: (val) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .swithThemeMode(val);
              }),
          Text('dark mode')
        ],
      )),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
