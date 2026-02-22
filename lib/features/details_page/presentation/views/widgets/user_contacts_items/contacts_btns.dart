import 'package:dallal_proj/core/theme/app_colors.dart';

import 'package:dallal_proj/core/shared/components/app_btns/ico_only_btn.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class ContactsBtns extends StatelessWidget {
  const ContactsBtns({
    super.key,
    this.whatsAppOnTap,
    this.smsOnTap,
    this.callOnTap,
  });
  final void Function()? whatsAppOnTap, smsOnTap, callOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(flex: 2),
        IcoOnlyBtn(img: Assets.icons.svg.sms, onTap: smsOnTap),
        const Spacer(flex: 3),
        IcoOnlyBtn(img: Assets.icons.svg.call, onTap: callOnTap),
        const Spacer(flex: 3),
        IcoOnlyBtn(
          onTap: whatsAppOnTap,
          img: Assets.icons.svg.whatsapp,
          fillCol: Colors.white,
          color: kPrimColG,
        ),
        const Spacer(flex: 8),
      ],
    );
  }
}
