import 'package:calculator_app/screens/home_screen/components/calculator_button.dart';
import 'package:flutter/material.dart';

import 'components/calculation_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Widget> get row1 => const [
        CalculatorButton(
          text: 'C',
          textColor: Color(0xff894028),
        ),
        CalculatorButton(
          text: '+/\u2212',
          fontSize: 32,
        ),
        CalculatorButton(text: '%'),
        CalculatorButton(
          text: '\u00F7',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row2 => [
        for (final i in ['1', '2', '3'])
          CalculatorButton(
            text: i,
            shape: Shape.circle,
          ),
        const CalculatorButton(
          text: '\u00D7',
          fontSize: 52,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row3 => [
        for (final i in ['4', '5', '6'])
          CalculatorButton(
            text: i,
            shape: Shape.circle,
          ),
        const CalculatorButton(
          text: '\u2212',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row4 => [
        for (final i in ['7', '8', '9'])
          CalculatorButton(
            text: i,
            shape: Shape.circle,
          ),
        const CalculatorButton(
          text: '+',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];

  List<Widget> get row5 => const [
        CalculatorButton(
          text: '0',
          width: 156,
          shape: Shape.stadium,
        ),
        CalculatorButton(
          text: '.',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        ),
        CalculatorButton(
          text: '=',
          fontSize: 44,
          fontWeight: FontWeight.normal,
        )
      ];

  @override
  Widget build(BuildContext context) {
    final rows = [row1, row2, row3, row4, row5];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: CalculationText(),
          ),
          const Spacer(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: rows[index],
            ),
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemCount: rows.length,
          ),
          const SizedBox(
            height: 56,
          )
        ],
      ),
    );
  }
}
