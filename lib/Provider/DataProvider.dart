// ignore_for_file: prefer_const_declarations

import 'package:bund_test/Cloud/CloudServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataProvider with ChangeNotifier {
  //storing the user data at cloud firestore with id = 1
  CloudServices cloudServices = CloudServices();

  void updateTerm({required int term}) async {
    await cloudServices.updateInDatabase(id: 'term', data: term);
    String formatter = DateFormat('y').format(DateTime.now());
    final datewithterm = int.parse(formatter) + term;
    print(datewithterm);
    await cloudServices.updateInDatabase(id: 'date', data: datewithterm);
    CalcCapitalAtMaturity();
    CalcTotalInterest();
    CalcAnnualInterest();
    notifyListeners();
  }

  Future<int> changes() async {
    int amount = await cloudServices.getAmount();
    int change = 0;
    if (amount > 10000) {
      change = 10000;
    } else {
      change = 1000;
    }
    return change;
  }

  void Add() async {
    int change = await changes();
    int amount = await cloudServices.getAmount();
    amount += change;
    await cloudServices.updateInDatabase(id: 'amount', data: amount);
    CalcCapitalAtMaturity();
    CalcTotalInterest();
    CalcAnnualInterest();
    notifyListeners();
  }

  void Sub() async {
    int amount = await cloudServices.getAmount();
    int change = await changes();
    if (amount - change >= 250) {
      amount -= change;
    } else {
      amount = 250;
    }
    await cloudServices.updateInDatabase(id: 'amount', data: amount);
    CalcCapitalAtMaturity();
    CalcTotalInterest();
    CalcAnnualInterest();
    notifyListeners();
  }

  void CalcCapitalAtMaturity() async {
    final aytm = 6.81 / 100;
    final term = await cloudServices.getTerm();
    final amount = await cloudServices.getAmount();
    final capitalatmaturity = (aytm * term * amount) + amount;
    await cloudServices.updateInDatabase(
        id: 'capitalatmaturity', data: capitalatmaturity);
    notifyListeners();
  }

  void CalcTotalInterest() async {
    final aytm = 6.81 / 100;
    final term = await cloudServices.getTerm();
    final amount = await cloudServices.getAmount();
    final totalinterest = aytm * term * amount;
    await cloudServices.updateInDatabase(
        id: 'totalinterest', data: totalinterest);
    notifyListeners();
  }

  void CalcAnnualInterest() async {
    final aytm = 6.81 / 100;
    final amount = await cloudServices.getAmount();
    final annualinterest = aytm * amount;
    await cloudServices.updateInDatabase(
        id: 'annualinterest', data: annualinterest);
    notifyListeners();
  }

  Future<int> getAmount() async {
    final x = await cloudServices.getAmount();
    notifyListeners();
    return x;
  }

  Future<double> getCapitalMaturity() async {
    final x = await cloudServices.getCapitalMaturity();
    notifyListeners();
    return x;
  }

  Future<double> getTotalInterest() async {
    final x = await cloudServices.getTotalInterest();
    notifyListeners();
    return x;
  }

  Future<double> getAnnualInterest() async {
    final x = await cloudServices.getAnnualInterest();
    notifyListeners();
    return x;
  }

  Future<int> getTerm() async {
    final x = await cloudServices.getTerm();
    notifyListeners();
    return x;
  }

  Future<int> getDate() async {
    final x = await cloudServices.getDate();
    notifyListeners();
    return x;
  }
}
