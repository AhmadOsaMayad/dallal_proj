import 'dart:developer';

import 'package:dallal_proj/core/theme/app_colors.dart';
import 'package:dallal_proj/core/shared/widgets/helpers/s_bx.dart';
import 'package:dallal_proj/features/login_page/presentation/views/add_profile_item.dart.dart';
import 'package:dallal_proj/features/my_account_page/presentation/views/widgets/personal_info_form.dart';
import 'package:flutter/material.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({
    super.key,
    required this.name,
    required this.phone,
    this.whatsAppNum,
    this.img,
  });
  final String name, phone;
  final String? whatsAppNum, img;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonalInfoForm(
          name: name,
          phone: phone,
          whatsAppNum: whatsAppNum,
          withWhatsAppNum: (whatsAppNum != null) ? true : false,
        ),
        SBx.w15,
        AddProfileItem(
          enableEdit: false,
          showEditIcon: false,
          size: 100,
          initialImageUrl: img,
          onImageChanged: (base64Image) {
            log('Profile image selected: ${base64Image?.substring(0, 20)}...');
          },
        ),
      ],
    );
  }
}

class PersonalInfoCard2 extends StatelessWidget {
  const PersonalInfoCard2({
    super.key,
    required this.name,
    required this.phone,
    this.email,
    this.img,
  });
  final String name, phone;
  final String? email, img;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AssetProfileItem(assetPath: img, size: 120),
        SBx.h15,
        PersonalInfoForm2(
          name: name,
          phone: phone,
          email: email,
          withWhatsAppNum: (email != null) ? true : false,
        ),
      ],
    );
  }
}

/// A simple profile image widget that displays images from assets
/// Similar to AddProfileItem but without edit functionality and uses asset images
class AssetProfileItem extends StatelessWidget {
  const AssetProfileItem({
    super.key,
    this.assetPath,
    this.size = 100.0,
    this.iconSize = 40.0,
    this.borderRadius = 360.0,
    this.borderColor,
    this.borderWidth = 2.0,
    this.backgroundColor,
    this.placeholderIcon = Icons.person_rounded,
    this.placeholderIconColor,
  });

  /// Path to the asset image (e.g., 'assets/imgs/profile.png')
  final String? assetPath;

  /// Size of the profile image container
  final double size;

  /// Size of the placeholder icon
  final double iconSize;

  /// Border radius (360 for circle)
  final double borderRadius;

  /// Border color (defaults to grey[300])
  final Color? borderColor;

  /// Border width
  final double borderWidth;

  /// Background color for placeholder
  final Color? backgroundColor;

  /// Icon to show when no image
  final IconData placeholderIcon;

  /// Color of placeholder icon
  final Color? placeholderIconColor;

  Widget _buildImageContent() {
    if (assetPath != null && assetPath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          assetPath!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => _buildPlaceholderState(),
        ),
      );
    }
    return _buildPlaceholderState();
  }

  Widget _buildPlaceholderState() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        color: backgroundColor ?? Colors.grey[200],
        child: Center(
          child: Icon(
            placeholderIcon,
            size: iconSize,
            color: placeholderIconColor ?? kPrimColG,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.grey[300]!,
          width: borderWidth,
        ),
      ),
      child: _buildImageContent(),
    );
  }
}
