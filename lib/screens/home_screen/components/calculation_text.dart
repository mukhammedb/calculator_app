import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationText extends ConsumerWidget {
  const CalculationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 32,
              color: kSecondaryColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
