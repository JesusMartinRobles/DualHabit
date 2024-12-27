import 'package:flutter/material.dart'; // Importa el paquete material.dart
import 'package:uuid/uuid.dart'; // Importa el paquete uuid.dart
import '../../domain/entities/habit.dart'; // Importa la entidad Habit

class HabitViewModel extends ChangeNotifier {
  // Clase HabitViewModel
  final List<Habit> _habits = []; // Lista de hábitos

  List<Habit> get habits => _habits; // Getter de la lista de hábitos

  void addHabit(String name, String description) {
    // Método para añadir un hábito
    final habit = Habit(
      // Crea un hábito
      id: Uuid().v4(), // Utiliza UUID para generar un ID único
      name: name, // Nombre del hábito
      description: description, // Descripción del hábito
      creationDate: DateTime.now(), // Fecha de creación del hábito
    );
    _habits.add(habit); // Añade el hábito a la lista de hábitos
    notifyListeners(); // Notifica a los oyentes
  }

  void removeHabit(String id) {
    // Método para eliminar un hábito
    _habits.removeWhere((habit) => habit.id == id); // Elimina el hábito
    notifyListeners(); // Notifica a los oyentes
  }

  void toggleHabitCompletion(String id) {
    // Método para cambiar el estado de completado de un hábito
    final index = _habits
        .indexWhere((habit) => habit.id == id); // Obtiene el índice del hábito
    if (index != -1) {
      // Comprueba que el índice no sea -1

      final habit = _habits[index]; // Obtiene el hábito

      List<DateTime> updateCompletionDates =
          List.from(habit.completionDates); // Lista de fechas de completado
      if (habit.isCompletedToday) {
        // Comprueba si el hábito está completado hoy
        updateCompletionDates.removeWhere((date) =>
            date.year == DateTime.now().year &&
            date.month == DateTime.now().month &&
            date.day ==
                DateTime.now().day); // Elimina la fecha de completado de hoy
      } else {
        updateCompletionDates
            .add(DateTime.now()); // Añade la fecha de completado de hoy
      }
      _habits[index] = Habit(
        // Cambia el estado de completado del hábito
        id: _habits[index].id, // ID del hábito
        name: _habits[index].name, // Nombre del hábito
        description: _habits[index].description, // Descripción del hábito
        creationDate:
            _habits[index].creationDate, // Fecha de creación del hábito
        isCompletedToday: !_habits[index]
            .isCompletedToday, // Cambia el estado de completado del hábito
        completionDates: updateCompletionDates, // Lista de fechas de completado
      );
      notifyListeners(); // Notifica a los oyentes
    }
  }
}
