import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/habit_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final habitViewModel = Provider.of<HabitViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('DualHabit'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: habitViewModel.habits.length,
              itemBuilder: (context, index) {
                final habit = habitViewModel.habits[index];
                return ListTile(
                  title: Text(habit.name),
                  trailing: Checkbox(
                    value: habit.isCompletedToday,
                    onChanged: (value) {
                      habitViewModel.toggleHabitCompletion(habit.id);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  habitViewModel.addHabit(value);
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter habit name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
