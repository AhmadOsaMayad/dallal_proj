import 'package:dallal_proj/core/components/app_bottom_sheets/filter_b_s/filter_funcs.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/utils/app_funcs.dart';
import 'package:flutter/material.dart';

class CLwid {
  static List<DropdownMenuEntry<String>> cddmList({required bool isFltr}) {
    return [
      Fltr.ddmNtry(kCurrYER, kCurrYER, textAlign: Alignment.centerLeft),
      Fltr.ddmNtry(kCurrSAR, kCurrSAR, textAlign: Alignment.centerLeft),
      Fltr.ddmNtry(kCurrUSD, kCurrUSD, textAlign: Alignment.centerLeft),
      if (isFltr) Fltr.ddmNtry('ALL', 'ALL', textAlign: Alignment.centerLeft),
    ];
  }

  static kGridDelegate(BuildContext context) =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        childAspectRatio: context.respFMQ(itmFract: 0.29246),
        //Funcs.respFMQ(itmFract: 0.29246, context: context),
        //: 189 / 320,
      );

  static List<DropdownMenuEntry<String>> ddmList() {
    return [
      Fltr.ddmNtry('sanaa', 'صنعاء'),
      Fltr.ddmNtry('taiz', 'تعز'),
      Fltr.ddmNtry('aden', 'عدن'),
      Fltr.ddmNtry('ibb', 'إب'),
      Fltr.ddmNtry('dhamar', 'ذمار'),
      Fltr.ddmNtry('hadramout', 'حضرموت'),
      Fltr.ddmNtry('hodeidah', 'الحديدة'),
      Fltr.ddmNtry('yareem', 'يريم'),
      Fltr.ddmNtry('saada', 'صعدة'),
      Fltr.ddmNtry('amran', 'عمران'),
      Fltr.ddmNtry('raymah', 'ريمة'),
      Fltr.ddmNtry('mahweet', 'المحويت'),
      Fltr.ddmNtry('haggah', 'حجة'),
      Fltr.ddmNtry('lahj', 'لحج'),
      Fltr.ddmNtry('mahrah', 'المهرة'),
      Fltr.ddmNtry('shabwa', 'شبوة'),
      Fltr.ddmNtry('marib', 'مأرب'),
      Fltr.ddmNtry('aljawf', 'الجوف'),
      Fltr.ddmNtry('albayda', 'البيضاء'),
      Fltr.ddmNtry('aldhale', 'الضالع'),
      Fltr.ddmNtry('socotra', 'سقطرى'),
      Fltr.ddmNtry('abian', 'أبين'),
    ];
  }
}
