import 'package:dinamic_not_hesaplama/model/dersler.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<String> tumDersNotlari() {
    return [
      'AA',
      'AB',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _harfNotuCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'AB':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.000000000000000001;
      case 'FF':
        return 0;
      default:
        return 0.3;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return tumDersNotlari()
        .map(
          (e) => DropdownMenuItem(
            value: _harfNotuCevir(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List<int> tumKrediler() {
    return List.generate(
      10,
      (index) => index + 1,
    ).toList();
  }

  static List<DropdownMenuItem<double>> tumKrediSayilari() {
    return tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(e.toString()),
          ),
        )
        .toList();
  }

  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var element in tumEklenenDersler) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    }
    return toplamNot / toplamKredi;
  }
}
