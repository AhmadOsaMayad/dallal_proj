import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/features/my_account_page/presentation/views/widgets/personal_info_holder.dart';
import 'package:flutter/material.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({
    super.key,
    required this.withWhatsAppNum,
    required this.name,
    required this.phone,
    this.whatsAppNum,
  });
  final bool withWhatsAppNum;
  final String name, phone;
  final String? whatsAppNum;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PersonalInfoHolder(title: 'الاسم   ', info: ' $name '),
        SizedBox(height: context.respHieght(fract: 0.0162)),
        // SizedBox(height: Funcs.respHieght(fract: 0.0162, context: context)),
        PersonalInfoHolder(title: 'رقم الهاتف   ', info: ' $phone '),
        SizedBox(height: context.respHieght(fract: 0.0162)),

        // SizedBox(height: Funcs.respHieght(fract: 0.0162, context: context)),
        if (withWhatsAppNum)
          PersonalInfoHolder(
            title: 'رقم الواتساب   ',
            info: whatsAppNum != null ? ' $whatsAppNum ' : ' غير مضاف ',
          ),
      ],
    );
  }
}

class PersonalInfoForm2 extends StatelessWidget {
  const PersonalInfoForm2({
    super.key,
    required this.withWhatsAppNum,
    required this.name,
    required this.phone,
    this.email,
  });
  final bool withWhatsAppNum;
  final String name, phone;
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PersonalInfoHolder2(title: 'الاسم   ', info: ' $name '),
        SizedBox(height: context.respHieght(fract: 0.0162)),

        // SizedBox(height: Funcs.respHieght(fract: 0.0162, context: context)),
        PersonalInfoHolder2(title: 'الهاتف   ', info: ' $phone '),
        SizedBox(height: context.respHieght(fract: 0.0162)),

        // SizedBox(height: Funcs.respHieght(fract: 0.0162, context: context)),
        if (withWhatsAppNum)
          PersonalInfoHolder2(
            title: 'الإيميل ',
            info: email != null ? ' $email ' : ' غير مضاف ',
          ),
      ],
    );
  }
}
