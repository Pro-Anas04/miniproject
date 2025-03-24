import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  static const keyDarkMode = 'key-dark-mode';

  Widget themeMode() {
    return SwitchSettingsTile(
      title: 'Dark Mode',
      leading: Icon(
        Icons.dark_mode,
        color: Color(0xFF642ef3),
      ),
      settingKey: keyDarkMode,
    );
  }

  Widget buildCurrency() {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: DropDownSettingsTile(
        title: 'Currency',
        leading: Icon(
          Icons.money,
          color: Color(0xFF642ef3),
        ),
        settingKey: 'key-currency',
        values: <int, String>{
          1: 'THB',
          2: 'USD',
          3: 'EUR',
          4: 'CNY',
          5: 'GBP',
          6: 'JPY',
        },
        selected: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(fontSize: 26, color: Colors.green[400]),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            themeMode(),
            buildCurrency(),
          ],
        ),
      ),
    );
  }
}
