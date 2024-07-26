import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:dinamic_not_hesaplama/helper/data_helper.dart';
import 'package:dinamic_not_hesaplama/model/dersler.dart';
import 'package:dinamic_not_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamic_not_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamic_not_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamic_not_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  // ignore: non_constant_identifier_names
  var FormKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenKredi = 1;
  String secilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: _buildForm(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      ortalama: DataHelper.ortalamaHesapla(),
                      dersSayisi: DataHelper.tumEklenenDersler.length),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: DersListesi1(
                onDismiss: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ],
                    color: Colors.indigo,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(50)),
                child: ElevatedButton(
                    onPressed: () {
                      DataHelper.tumEklenenDersler.clear();
                      setState(() {});
                    },
                    child: Text(
                      'Temizle',
                      style: Sabitler.dersSayisiStyle,
                    )),
              ),
            )
          ],
        ));
  }

  _buildForm() {
    return Form(
      key: FormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: HarfDropdownWidget(onHarfSecildi: (harf) {
                    secilenDeger = harf;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: KrediDropdownWidget(onKrediSecildi: (kredi) {
                    secilenKredi = kredi;
                  }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          secilenDersAdi = newValue!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'Ders Adı giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius,
          ),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.5)),
    );
  }

  _dersEkleVeOrtalamaHesapla() {
    if (FormKey.currentState!.validate()) {
      FormKey.currentState!.save();
      var eklenecekders = Ders(
          ad: secilenDersAdi,
          harfDegeri: secilenDeger,
          krediDegeri: secilenKredi);

      DataHelper.dersEkle(eklenecekders);
    }
  }
}
