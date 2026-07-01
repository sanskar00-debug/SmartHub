import 'package:flutter/material.dart';

enum ExpenseCategory {
  food,
  transport,
  housing,
  entertainment,
  utilities,
  other,
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'amount': amount,
        'date': date.toIso8601String(),
        'category': category.toString().split('.').last,
      };

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: ExpenseCategory.values.firstWhere(
          (e) => e.toString().split('.').last == json['category']),
    );
  }
}
