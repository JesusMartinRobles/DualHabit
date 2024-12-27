class Habit {
  // Clase Habit
  final String id; // ID del hábito
  final String name; // Nombre del hábito
  final String description; // Descripción del hábito
  final DateTime creationDate; // Fecha de creación del hábito
  final bool isCompletedToday; // Estado de completado del hábito

  Habit({
    // Constructor de la clase Habit
    required this.id, // ID del hábito
    required this.name, // Nombre del hábito
    required this.description, // Descripción del hábito
    required this.creationDate, // Fecha de creación del hábito
    this.isCompletedToday = false, // Estado de completado del hábito
  });
}
