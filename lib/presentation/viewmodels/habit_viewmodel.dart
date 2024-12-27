import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/habit.dart';

class HabitViewModel extends ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(String name) {
    final habit = Habit(
      id: Uuid().v4(), // Utiliza UUID para generar un ID único
      name: name,
      creationDate: DateTime.now(),
    );
    _habits.add(habit);
    notifyListeners();
  }

  void toggleHabitCompletion(String id) {
    final index = _habits.indexWhere((habit) => habit.id == id);
    if (index != -1) {
      _habits[index] = Habit(
        id: _habits[index].id,
        name: _habits[index].name,
        creationDate: _habits[index].creationDate,
        isCompletedToday: !_habits[index].isCompletedToday,
      );
      notifyListeners();
    }
  }
}
