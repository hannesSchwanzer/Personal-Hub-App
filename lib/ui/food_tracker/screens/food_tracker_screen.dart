import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/food_tracker/screens/food_tracker_add_screen.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/food_tracker_view_model.dart';

/// FoodTrackerScreen displays the sum of macros and calories for today's tracked food entries.
/// A FloatingActionButton allows the user to start adding a new entry (functionality is a placeholder).
class FoodTrackerScreen extends ConsumerStatefulWidget {
  const FoodTrackerScreen({super.key});

  @override
  ConsumerState<FoodTrackerScreen> createState() => _FoodTrackerScreenState();
}

class _FoodTrackerScreenState extends ConsumerState<FoodTrackerScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void _changeDate(int days) {
    final newDate = selectedDate.add(Duration(days: days));
    final today = DateTime.now();
    final isFuture = newDate.isAfter(
      DateTime(today.year, today.month, today.day),
    );
    if (!isFuture) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  String _formatDate(DateTime date) {
    final today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    }
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(foodTrackerViewModelProvider(selectedDate));
    final notifier = ref.read(
      foodTrackerViewModelProvider(selectedDate).notifier,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Food Tracker')),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity != null) {
            if (details.primaryVelocity! > 0) {
              // Swipe right: go to previous day
              _changeDate(-1);
            } else if (details.primaryVelocity! < 0) {
              // Swipe left: go to next day, but not after today
              _changeDate(1);
            }
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: Text(
                  _formatDate(selectedDate),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: viewModel.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, trace) {
                  // Print the error and stacktrace before showing the error UI.
                  // ignore: avoid_print
                  print('FoodTrackerScreen error: $e');
                  // ignore: avoid_print
                  print(trace);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          'Something went wrong: \n${e.toString()}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
                data: (state) {
                  final macros = state.totalNutrition;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        margin: const EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Today\'s Summary',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _MacroSummary(
                                    title: 'Calories',
                                    value:
                                        macros.energyKcal?.toStringAsFixed(0) ??
                                        '0',
                                    unit: 'kcal',
                                  ),
                                  _MacroSummary(
                                    title: 'Protein',
                                    value:
                                        macros.proteins?.toStringAsFixed(1) ??
                                        '0',
                                    unit: 'g',
                                  ),
                                  _MacroSummary(
                                    title: 'Carbs',
                                    value:
                                        macros.carbohydrates?.toStringAsFixed(
                                          1,
                                        ) ??
                                        '0',
                                    unit: 'g',
                                  ),
                                  _MacroSummary(
                                    title: 'Fat',
                                    value:
                                        macros.fat?.toStringAsFixed(1) ?? '0',
                                    unit: 'g',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // List today's tracked food entries, sorted by time (newest first)
                      Expanded(
                        child: state.todayTrackings.isEmpty
                            ? const Center(
                                child: Text("No food entries tracked yet."),
                              )
                            : ListView.builder(
                                itemCount: state.todayTrackings.length,
                                itemBuilder: (context, index) {
                                  final entries = List.of(state.todayTrackings)
                                    ..sort(
                                      (a, b) =>
                                          b.trackedAt.compareTo(a.trackedAt),
                                    );
                                  final tracking = entries[index];
                                  final nutrition =
                                      tracking.nutrition * tracking.quantity;
                                  return Card(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 6,
                                    ),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(12),
                                      title: Text(
                                        tracking.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${tracking.quantity} ${tracking.nutrition.quantityUnit?.abbreviation}',
                                          ),
                                          const SizedBox(height: 6),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              _MacroSummary(
                                                title: 'kcal',
                                                value:
                                                    nutrition.energyKcal
                                                        ?.toStringAsFixed(0) ??
                                                    '0',
                                                unit: '',
                                                fontSize: 14,
                                                spacing: 6,
                                              ),
                                              SizedBox(width: 14),
                                              _MacroSummary(
                                                title: 'Protein',
                                                value:
                                                    nutrition.proteins
                                                        ?.toStringAsFixed(1) ??
                                                    '0',
                                                unit: 'g',
                                                fontSize: 14,
                                                spacing: 2,
                                              ),
                                              SizedBox(width: 14),
                                              _MacroSummary(
                                                title: 'Carbs',
                                                value:
                                                    nutrition.carbohydrates
                                                        ?.toStringAsFixed(1) ??
                                                    '0',
                                                unit: 'g',
                                                fontSize: 14,
                                                spacing: 2,
                                              ),
                                              SizedBox(width: 14),
                                              _MacroSummary(
                                                title: 'Fat',
                                                value:
                                                    nutrition.fat
                                                        ?.toStringAsFixed(1) ??
                                                    '0',
                                                unit: 'g',
                                                fontSize: 14,
                                                spacing: 2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        tooltip: 'Delete entry',
                                        onPressed: () async {
                                          await notifier.deleteFoodEntry(
                                            tracking.id,
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text('Entry deleted!'),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodTrackerAddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Helper widget to display a macro value with units.
class _MacroSummary extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final double fontSize;
  final double spacing;

  /// Compact macro summary for food entry cards.
  /// [fontSize] and [spacing] adapt the text appearance for list/card views.
  const _MacroSummary({
    required this.title,
    required this.value,
    required this.unit,
    this.fontSize = 16,
    this.spacing = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 0.75,
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
          ),
          Text(
            unit,
            style: TextStyle(color: Colors.grey, fontSize: fontSize * 0.70),
          ),
        ],
      ),
    );
  }
}
