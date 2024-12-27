import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/viewmodels/habit_viewmodel.dart';

void main() {
  runApp(DualHabit());
}

class DualHabit extends StatelessWidget {
  const DualHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HabitViewModel(),
      child: MaterialApp(
        title: 'DualHabit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
