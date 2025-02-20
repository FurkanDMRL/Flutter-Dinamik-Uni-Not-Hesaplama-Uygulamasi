import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:dinamic_not_hesaplama/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik ${Sabitler.baslikText}',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const OrtalamaHesaplaPage(),
    );
  }
}
