import '../entities/habit.dart'; // Importa la entidad Habit

class AddHabit {
  // Clase AddHabit
  final List<Habit> habits; // Lista de hábitos

  AddHabit(this.habits); // Constructor de la clase AddHabit

  void call(Habit habit) {
    // Método call
    habits.add(habit); // Añade el hábito a la lista de hábitos
  }
}
