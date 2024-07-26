// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Giriniz',
            style: Sabitler.dersSayisiStyle,
          ),
          Text(
            ortalama >= 0 ? ortalama.toStringAsFixed(2) : '0.0',
            style: Sabitler.OrtalamaStyle,
          ),
          Text(
            'Ortalama',
            style: Sabitler.dersSayisiStyle,
          )
        ],
      ),
    );
  }
}
