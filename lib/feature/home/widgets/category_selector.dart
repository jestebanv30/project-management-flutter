import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = [
    "Popular",
    "Recommended",
    "New Topic",
    "Latest"
  ];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            bool isSelected = selectedCategory == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Chip(
                  backgroundColor: isSelected
                      ? const Color(
                          0xffcce8f9) // Color de fondo cuando está seleccionado
                      : const Color(
                          0xffe7ebf6), // Color de fondo cuando no está seleccionado
                  side: const BorderSide(
                      color: Colors.transparent), // Borde transparente
                  label: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).primaryColorLight
                          : Colors.grey.shade700,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
