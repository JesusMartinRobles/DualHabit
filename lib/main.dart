import 'package:flutter/material.dart'; // Importa el paquete material.dart
import 'package:provider/provider.dart'; // Importa el paquete provider.dart
import 'presentation/pages/home_page.dart'; // Importa la página de inicio
import 'presentation/viewmodels/habit_viewmodel.dart'; // Importa el ViewModel de los hábitos

void main() {
  // Punto de entrada de la aplicación
  runApp(DualHabit()); // Ejecuta la aplicación
}

class DualHabit extends StatelessWidget {
  // Clase DualHabit
  const DualHabit({super.key}); // Constructor de la clase DualHabit

  @override // Anotación que sobrescribe el método build
  Widget build(BuildContext context) {
    // Método build
    return ChangeNotifierProvider(
      // Proveedor de cambio de notificador
      create: (context) => HabitViewModel(), // Crea un ViewModel de hábitos
      child: MaterialApp(
        // Material de la aplicación
        debugShowCheckedModeBanner: false, // Oculta la cinta de depuración
        title: 'DualHabit', // Título de la aplicación
        theme: ThemeData(
          // Tema de la aplicación
          primarySwatch: Colors.blue, // Color principal
        ),
        home: HomePage(), // Página de inicio
      ),
    );
  }
}
