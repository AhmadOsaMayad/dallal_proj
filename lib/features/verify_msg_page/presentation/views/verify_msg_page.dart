import 'package:dallal_proj/core/shared/widgets/custom_app_bar.dart';
import 'package:dallal_proj/core/shared/widgets/page_padding.dart';
import 'package:dallal_proj/core/shared/widgets/unfocus_ontap.dart';
import 'package:dallal_proj/features/verify_msg_page/domain/entities/verify_msg_entity.dart';
import 'package:dallal_proj/features/verify_msg_page/presentation/views/widgets/verify_msg_body.dart';
import 'package:flutter/material.dart';

class VerifyMsgPage extends StatelessWidget {
  const VerifyMsgPage({super.key, required this.vMsgModel});
  final VerifyMsgEntity vMsgModel;

  @override
  Widget build(BuildContext context) {
    return UnfocusOntap(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: PagePadding(child: VerifyMsgBody(vMsgModel: vMsgModel)),
      ),
    );
  }
}
