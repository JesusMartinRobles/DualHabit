class Habit {
  // Clase Habit
  final String id; // ID del hábito
  final String name; // Nombre del hábito
  final String description; // Descripción del hábito
  final DateTime creationDate; // Fecha de creación del hábito
  final bool isCompletedToday; // Estado de completado del hábito
  final List<DateTime> completionDates; // Lista de fechas de completado

  Habit({
    // Constructor de la clase Habit
    required this.id, // ID del hábito
    required this.name, // Nombre del hábito
    this.description = '', // Descripción del hábito
    required this.creationDate, // Fecha de creación del hábito
    this.isCompletedToday = false, // Estado de completado del hábito
    List<DateTime>? completionDates, // Lista de fechas de completado
  }) : completionDates = completionDates ??
            []; // Inicializa la lista de fechas de completado

  Map<String, dynamic> toMap() {
    // Método para convertir un hábito en un mapa
    return {
      'id': id, // ID del hábito
      'name': name, // Nombre del hábito
      'description': description, // Descripción del hábito
      'creationDate':
          creationDate.toIso8601String(), // Fecha de creación del hábito
      'isCompletedToday':
          isCompletedToday ? 1 : 0, // Estado de completado del hábito
      'completionDates': completionDates // Lista de fechas de completado
          .map((date) => date.toIso8601String())
          .toList(),
    };
  }

  // Crear un habit a partir de un mapa
  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      creationDate: DateTime.parse(map['creationDate']),
      isCompletedToday: map['isCompletedToday'] == 1,
      completionDates: List<String>.from(map['completionDates'])
          .map((date) => DateTime.parse(date))
          .toList(),
    );
  }
}
