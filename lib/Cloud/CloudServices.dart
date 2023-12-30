import 'package:cloud_firestore/cloud_firestore.dart';

class CloudServices {
  final userdatabase = FirebaseFirestore.instance.collection('UserData');
  //storing the user data at cloud firestore with id = 1
  Future<void> updateInDatabase({
    required String id,
    required data,
  }) async {
    try {
      await userdatabase.doc('1').update({id: data});
    } catch (e) {
      FirebaseException;
    }
  }

  Future<double> getCapitalMaturity() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['capitalatmaturity']);
    return x;
  }

  Future<double> getTotalInterest() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['totalinterest']);

    return x;
  }

  Future<double> getAnnualInterest() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['annualinterest']);
    return x;
  }

  Future<int> getTerm() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['term']);
    return x;
  }

  Future<int> getAmount() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['amount']);
    return x;
  }

  Future<int> getDate() async {
    final x = await userdatabase
        .doc('1')
        .get()
        .then((value) => value.data()?['date']);
    return x;
  }
}
