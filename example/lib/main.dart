import 'package:example/flap/flap_demo.dart';
import 'package:multi_window/multi_widget.dart';
import 'package:multi_window/multi_window.dart';

import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:adwaita/adwaita.dart' as adwaita;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  MultiWindow.init(args);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
            theme: adwaita.lightTheme,
            darkTheme: adwaita.darkTheme,
            debugShowCheckedModeBanner: false,
            home: MultiWidget({
              'flap': FlapDemo(),
            }, fallback: MyHomePage(themeNotifier: themeNotifier)),
            themeMode: currentMode);
      },
    );
  }
}
