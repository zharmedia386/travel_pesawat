import 'package:travel_pesawat/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}

/* example value of variable
result:
 transactions
  |- transaction1
    |- id: "1"
    |- amount: 100
    |- type: "debit"
    |- date: "2022-01-01"
  |- transaction2
    |- id: "2"
    |- amount: 50
    |- type: "credit"
    |- date: "2022-02-01"
  |- transaction3
    |- id: "3"
    |- amount: 75
    |- type: "debit"
    |- date: "2022-03-01"

transactions = [
  TransactionModel(id: "1", amount: 100, type: "debit", date: "2022-01-01"),
  TransactionModel(id: "2", amount: 50, type: "credit", date: "2022-02-01
*/