import 'package:zen_tugas/custom_color.dart';
import 'package:zen_tugas/list_halaman/beranda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kontak',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Color(0xFF143F91)),
      ),
      home: HalamanBeranda(),
    );
  }
}
