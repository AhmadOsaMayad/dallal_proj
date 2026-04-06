import 'package:dallal_proj/core/components/app_cards/property_card/h_card/pending_btn.dart';
import 'package:dallal_proj/core/components/app_cards/property_card/h_card/refused_btn.dart';
import 'package:dallal_proj/core/components/app_cards/property_card/items/card_btns/card_seperated_btns_box.dart';
import 'package:dallal_proj/core/components/app_cards/property_card/items/property_card_helper.dart';
import 'package:flutter/material.dart';

class MyAdvSeperatedBtnsShimmer extends StatelessWidget {
  const MyAdvSeperatedBtnsShimmer({
    super.key,
    this.sepWidth,
    this.status,
  });
  final bool? status;
  final double? sepWidth;
  @override
  Widget build(BuildContext context) {
    return SeperatedBtnsBox(
      rMXAlign: MainAxisAlignment.center,
      children:
          (status == true)
              ? PCardH.normalAdvBtns(
                () {},
                () {},
                () {},
              )
              : (status == null)
              ? [
                PendingBtn(
                  onTap: () {},
                ),
              ]
              : [
                RefusedBtn(
                  onTap: () {},
                ),
              ],
    );
  }
}
