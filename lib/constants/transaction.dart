import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.createdAt,
      @required this.updatedAt});
}