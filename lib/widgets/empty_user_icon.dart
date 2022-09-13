import 'package:chatters/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class EmptyUserIcon extends StatelessWidget {
  const EmptyUserIcon({
    required this.size,
    required this.radius,
    Key? key,
  }) : super(key: key);

  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(
        AppDimensions.userIconImagePadding,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: const Image(
          image: AssetImage('assets/images/empty_user_image.jpeg'),
        ),
      ),
    );
  }
}
