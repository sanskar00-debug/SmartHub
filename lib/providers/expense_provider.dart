import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/expense_model.dart';
import '../services/expense_service.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final ExpenseService _expenseService = ExpenseService();
  final Uuid _uuid = Uuid();

  ExpenseProvider() {
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    _isLoading = true;
    notifyListeners();
    try {
      _expenses = await _expenseService.loadExpenses();
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addExpense(String title, double amount, DateTime date, ExpenseCategory category) async {
    _isLoading = true;
    notifyListeners();
    try {
      final newExpense = Expense(
        id: _uuid.v4(),
        title: title,
        amount: amount,
        date: date,
        category: category,
      );
      await _expenseService.addExpense(newExpense);
      _expenses.add(newExpense);
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteExpense(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _expenseService.deleteExpense(id);
      _expenses.removeWhere((expense) => expense.id == id);
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
