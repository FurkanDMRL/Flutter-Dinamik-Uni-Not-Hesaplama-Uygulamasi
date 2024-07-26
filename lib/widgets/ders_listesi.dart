// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:dinamic_not_hesaplama/helper/data_helper.dart';
import 'package:dinamic_not_hesaplama/model/dersler.dart';

class DersListesi1 extends StatelessWidget {
  final Function onDismiss;
  const DersListesi1({
    super.key,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        child: Text(_kelimeninIlkHarfiniAlanMetod(
                            tumDersler[index].ad)),
                      ),
                      subtitle: Text(
                          'Dersin Kredi :${tumDersler[index].krediDegeri} \nDersin Not Değeri : ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Lütfen Ders Giriniz',
              style: Sabitler.baslikStyle,
            ),
          );
  }

  _kelimeninIlkHarfiniAlanMetod(kelime) {
    String harf;
    harf = kelime[0];
    return harf.toUpperCase();
  }
}
