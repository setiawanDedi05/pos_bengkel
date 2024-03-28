import 'package:flutter/material.dart';
import 'package:pos_bengkel/core/extensions/int_ext.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class ProcessButton extends StatelessWidget {
  final int price;
  final String title;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isDisabled;

  const ProcessButton({
    super.key,
    required this.price,
    this.title = 'Proses',
    this.isPrimary = true,
    this.isDisabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? () {} : onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            color: isPrimary
                ? isDisabled
                    ? AppColors.grey
                    : AppColors.primary
                : isDisabled
                    ? AppColors.grey
                    : AppColors.white,
            border: Border.all(color: AppColors.primary)),
        child: Row(
          children: [
            Text(
              price.currencyFormatRp,
              style: TextStyle(
                color: isPrimary ? Colors.white : AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: TextStyle(
                color: isPrimary ? Colors.white : AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceWidth(5.0),
            Icon(
              Icons.chevron_right,
              color: isPrimary ? Colors.white : AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
