import 'dart:io';

import 'package:chatters/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    required this.size,
    required this.radius,
    this.imageFile,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  final double size;
  final double radius;
  final File? imageFile;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(
        AppDimensions.userIconImagePadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: imageUrl != null
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              )
            : Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
