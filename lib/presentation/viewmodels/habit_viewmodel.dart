import 'package:flutter/material.dart'; // Importa el paquete material.dart
import 'package:uuid/uuid.dart'; // Importa el paquete uuid.dart
import '../../domain/entities/habit.dart'; // Importa la entidad Habit

class HabitViewModel extends ChangeNotifier {
  // Clase HabitViewModel
  List<Habit> _habits = []; // Lista de hábitos

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

  void toggleHabitCompletion(String id) {
    // Método para cambiar el estado de completado de un hábito
    final index = _habits
        .indexWhere((habit) => habit.id == id); // Obtiene el índice del hábito
    if (index != -1) {
      // Comprueba que el índice no sea -1
      _habits[index] = Habit(
        // Cambia el estado de completado del hábito
        id: _habits[index].id, // ID del hábito
        name: _habits[index].name, // Nombre del hábito
        creationDate:
            _habits[index].creationDate, // Fecha de creación del hábito
        isCompletedToday: !_habits[index]
            .isCompletedToday, // Cambia el estado de completado del hábito
        description: '', // Descripción del hábito
      );
      notifyListeners(); // Notifica a los oyentes
    }
  }
}
