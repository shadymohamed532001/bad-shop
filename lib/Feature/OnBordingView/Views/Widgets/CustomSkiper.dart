import 'package:bag/Core/Uitls/AppStyles.dart';
import 'package:flutter/material.dart';

class CustomSkiper extends StatelessWidget {
  const CustomSkiper({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 40,
          left: 40,
          top: 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Skip',
              textAlign: TextAlign.end,
              style: appStyle.textStyle18
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
