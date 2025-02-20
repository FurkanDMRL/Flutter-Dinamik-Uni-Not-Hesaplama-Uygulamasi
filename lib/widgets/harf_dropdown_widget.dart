// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dinamic_not_hesaplama/constants/app_constants.dart';
import 'package:dinamic_not_hesaplama/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropdownWidget({
    super.key,
    required this.onHarfSecildi,
  });

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenDeger = 4;
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
        value: secilenDeger,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(() {
            secilenDeger = value!;
            widget.onHarfSecildi(secilenDeger);
          });
        },
      ),
    );
  }
}
