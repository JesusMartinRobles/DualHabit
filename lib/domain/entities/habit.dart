class Habit {
  final String id;
  final String name;
  final DateTime creationDate;
  final bool isCompletedToday;

  Habit({
    required this.id,
    required this.name,
    required this.creationDate,
    this.isCompletedToday = false,
  });
}
