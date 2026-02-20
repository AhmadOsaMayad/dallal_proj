import 'package:dallal_proj/core/utils/assets_data.dart';
import 'package:dallal_proj/core/shared/widgets/custom_app_bar.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/v_p_item.dart';
import 'package:dallal_proj/features/my_account_page/presentation/views/widgets/personal_info_card.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'تواصل بنا', showBackButton: true),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VPItem(
                  bSpc: 15,
                  tSpc: 15,
                  child: PersonalInfoCard2(
                    img: AssetsData.devAhmad,
                    name: 'م/أحمد أسامة معياد',
                    phone: '00967774188043',
                    email: 'ao699168@gmail.com',
                  ),
                ),
                VPItem(
                  bSpc: 15,
                  tSpc: 15,
                  child: PersonalInfoCard2(
                    img: AssetsData.devBasheer,
                    name: 'م/بشير معاذ العبسي',
                    phone: '00967770874493',
                    email: 'basheermoath903@gmail.com',
                  ),
                ),
                VPItem(
                  bSpc: 15,
                  tSpc: 15,
                  child: PersonalInfoCard2(
                    img: AssetsData.devGhassan,
                    name: 'م/غسان المقبلي',
                    phone: '00967774980813',
                    email: "ghassanalmoqbeli3@gmail.com",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
