import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculationProvider =
    ChangeNotifierProvider<CalculationNotifier>((_) => CalculationNotifier());

class CalculationNotifier extends ChangeNotifier {
  List<String> dataList = ['0'];
  String prevData = '';
  bool isSign = false;
  bool isResult = false;

  String get data => dataList.join('');

  void addNumber(String number) {
    if (isResult || (dataList.length == 1 && dataList.last == '0')) {
      dataList = [number];
      isResult = false;
    } else if (isSign) {
      dataList.add(number);
      isSign = false;
    } else if (dataList.last.startsWith('(')) {
      final temp = dataList.last.substring(0, dataList.last.length - 1);
      dataList.last = '$temp$number)';
    } else {
      dataList.last += number;
    }

    notifyListeners();
  }
}
