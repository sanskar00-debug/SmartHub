import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarthub/providers/expense_provider.dart';
import 'package:smarthub/providers/weather_provider.dart';
import 'package:smarthub/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => ExpenseProvider()),
      ],
      child: MaterialApp(
        title: 'SmartHub',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
