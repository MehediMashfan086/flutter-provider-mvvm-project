import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                    ),
                  )),
      ),
    );
  }
}
