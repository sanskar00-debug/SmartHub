import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/weather_display.dart';
import '../widgets/expense_list.dart';
import 'add_expense_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch weather for a default city when the dashboard loads
    Provider.of<WeatherProvider>(context, listen: false).fetchWeather('London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartHub Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Current Weather',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                if (weatherProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (weatherProvider.errorMessage != null) {
                  return Center(child: Text('Error: ${weatherProvider.errorMessage}'));
                } else if (weatherProvider.weather != null) {
                  return WeatherDisplay(weather: weatherProvider.weather!);
                } else {
                  return const Center(child: Text('No weather data available.'));
                }
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Recent Expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Consumer<ExpenseProvider>(
              builder: (context, expenseProvider, child) {
                if (expenseProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (expenseProvider.errorMessage != null) {
                  return Center(child: Text('Error: ${expenseProvider.errorMessage}'));
                } else if (expenseProvider.expenses.isEmpty) {
                  return const Center(child: Text('No expenses added yet.'));
                } else {
                  return ExpenseList(expenses: expenseProvider.expenses);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
