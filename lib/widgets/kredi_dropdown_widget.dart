// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:dinamic_not_hesaplama/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;

  const KrediDropdownWidget({
    super.key,
    required this.onKrediSecildi,
  });

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKredi = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.5),
        borderRadius: Sabitler.borderRadius,
        border: Border.all(width: 1),
      ),
      child: DropdownButton<double>(
        value: secilenKredi,
        items: DataHelper.tumKrediSayilari(),
        onChanged: (value) {
          setState(() {
            secilenKredi = value!;
            widget.onKrediSecildi(secilenKredi);
          });
        },
      ),
    );
  }
}
