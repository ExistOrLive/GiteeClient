import 'package:ZLGiteeClient/ui/Page/search/SearchPage.dart';
import 'package:flutter/material.dart';
import 'UI/Base/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiteeClient',
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      home: new SearchPage(),
    );
  }
}
