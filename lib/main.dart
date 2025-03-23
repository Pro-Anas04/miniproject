import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniproject/src/pages/addIncome.dart';

void main() {
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
      home: Addincome(),
    );
  }
}
