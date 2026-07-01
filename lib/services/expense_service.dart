import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/expense_model.dart';

class ExpenseService {
  static const String _expensesKey = 'expenses';

  Future<List<Expense>> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();
    final String? expensesString = prefs.getString(_expensesKey);

    if (expensesString != null) {
      final List<dynamic> jsonList = jsonDecode(expensesString);
      return jsonList.map((json) => Expense.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  Future<void> saveExpenses(List<Expense> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    final String expensesString = jsonEncode(expenses.map((e) => e.toJson()).toList());
    await prefs.setString(_expensesKey, expensesString);
  }

  Future<void> addExpense(Expense expense) async {
    List<Expense> expenses = await loadExpenses();
    expenses.add(expense);
    await saveExpenses(expenses);
  }

  Future<void> deleteExpense(String id) async {
    List<Expense> expenses = await loadExpenses();
    expenses.removeWhere((expense) => expense.id == id);
    await saveExpenses(expenses);
  }
}
