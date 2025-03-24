import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:miniproject/src/pages/addExpenses.dart';
import 'package:miniproject/src/pages/addIncome.dart';
import 'package:miniproject/src/pages/settingPage.dart';

void main() async {
  // ต้องเรียกใช้ก่อนใช้งาน asynchronous plugins
  WidgetsFlutterBinding.ensureInitialized();

  // เริ่มต้นใช้งาน Settings ก่อนที่จะโหลด Settingpage
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile",
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: addExpensesPage(),
    );
  }
}
