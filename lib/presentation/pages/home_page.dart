import 'package:flutter/material.dart'; // Importa el paquete material.dart
import 'package:provider/provider.dart'; // Importa el paquete provider.dart
import '../viewmodels/habit_viewmodel.dart'; // Importa el ViewModel de los hábitos

class HomePage extends StatelessWidget {
  // Clase HomePage
  // Creamos controladores para los TextFields
  final TextEditingController _nameController =
      TextEditingController(); // Controlador para el nombre del hábito
  final TextEditingController _descriptionController =
      TextEditingController(); // Controlador para la descripción del hábito

  @override
  Widget build(BuildContext context) {
    // Construye la página de inicio
    final habitViewModel = Provider.of<HabitViewModel>(
        context); // Obtiene el ViewModel de los hábitos

    return Scaffold(
      // Estructura de la página
      appBar: AppBar(
        // Barra de la aplicación
        title: Text('DualHabit'), // Título de la aplicación
      ),
      body: Column(
        // Columna de la página
        children: [
          // Lista de widgets
          Expanded(
            // Widget expandido
            child: ListView.builder(
              // Constructor de lista
              itemCount: habitViewModel.habits.length, // Número de hábitos
              itemBuilder: (context, index) {
                // Constructor de elementos
                final habit = habitViewModel.habits[index]; // Hábito actual
                return ListTile(
                  // Elemento de lista
                  title: Text(habit.name), // Título del hábito
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(habit.description), // Descripción del hábito
                      if (habit.isCompletedToday)
                        Text(
                          'Completado el: ${habit.completionDates.map((date) {
                            final day = date.day.toString().padLeft(2, '0');
                            final month = date.month.toString().padLeft(2, '0');
                            final year = date.year.toString();
                            return '$day-$month-$year';
                          }).join(', ')}',
                        ),
                    ],
                  ),
                  trailing: Row(
                    // Fila de la derecha
                    mainAxisSize: MainAxisSize.min, // Tamaño principal mínimo
                    children: [
                      // Lista de widgets
                      IconButton(
                        // Botón de icono
                        icon: Icon(Icons.delete), // Icono de eliminar
                        onPressed: () {
                          // Función al pulsar el botón
                          habitViewModel
                              .removeHabit(habit.id); // Elimina el hábito
                        },
                      ), // Botón de icono
                      Checkbox(
                        value: habit.isCompletedToday, // Valor del checkbox
                        onChanged: (value) {
                          habitViewModel.toggleHabitCompletion(habit
                              .id); // Cambia el estado de completado del hábito
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            // Relleno
            padding: const EdgeInsets.all(8.0), // Relleno de 8 píxeles
            child: Column(
              // Columna de la página
              children: [
                // Lista de widgets
                // Campo para el nombre del hábito
                TextField(
                  // Campo de texto
                  controller: _nameController, // Controlador del campo de texto
                  decoration: InputDecoration(
                    // Decoración del campo de texto
                    hintText:
                        'Introduce el nombre del hábito', // Texto de ayuda
                    border: OutlineInputBorder(), // Borde del campo de texto
                  ),
                ),
                SizedBox(height: 10), // Espacio entre los TextFields
                // Campo para la descripción del hábito
                TextField(
                  // Campo de texto
                  controller:
                      _descriptionController, // Controlador del campo de texto
                  decoration: InputDecoration(
                    // Decoración del campo de texto
                    hintText:
                        'Introduce la descripción del hábito', // Texto de ayuda
                    border: OutlineInputBorder(), // Borde del campo de texto
                  ),
                ),
                SizedBox(height: 10), // Espacio entre los TextFields
                // Botón para añadir el hábito
                ElevatedButton(
                  // Botón para añadir el hábito
                  onPressed: () {
                    // Añade el hábito a la lista de hábitos
                    final name =
                        _nameController.text; // Obtiene el nombre del hábito
                    final description = _descriptionController
                        .text; // Obtiene la descripción del hábito

                    if (name.isNotEmpty && description.isNotEmpty) {
                      // Comprueba que el nombre y la descripción no estén vacíos
                      habitViewModel.addHabit(name,
                          description); // Añade el hábito a la lista de hábitos
                      _nameController.clear(); // Limpia el TextField del nombre
                      _descriptionController
                          .clear(); // Limpia el TextField de la descripción
                    }
                  },
                  child: Text('Añadir hábito'), // Texto del botón
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
