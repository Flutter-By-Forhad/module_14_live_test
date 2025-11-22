import 'dart:convert';
import 'package:flutter/material.dart';

// Data model for Recipe
class Recipe {
  final int id;
  final String title;
  final String description;
  final int calories;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.calories,
  });

  // Factory constructor to create Recipe from JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      calories: json['calories'] as int,
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _parseJson();
  }

  void _parseJson() {
    // The provided JSON string
    const jsonString = '''
    [
      {
        "id": 1,
        "title": "Chicken Biryani",
        "description": "Aromatic basmati rice cooked with spiced chicken.",
        "calories": 550
      },
      {
        "id": 2,
        "title": "Beef Curry",
        "description": "Slow-cooked beef in a rich curry gravy.",
        "calories": 620
      },
      {
        "id": 3,
        "title": "Vegetable Khichuri",
        "description": "Rice and lentils cooked with mixed vegetables.",
        "calories": 400
      },
      {
        "id": 4,
        "title": "Pasta Alfredo",
        "description": "Creamy white sauce pasta with parmesan cheese.",
        "calories": 480
      },
      {
        "id": 5,
        "title": "Grilled Sandwich",
        "description": "Toasted sandwich filled with cheese and vegetables.",
        "calories": 310
      },
      {
        "id": 6,
        "title": "Chicken Fry",
        "description": "Crispy deep-fried chicken with spices.",
        "calories": 530
      },
      {
        "id": 7,
        "title": "Egg Curry",
        "description": "Boiled eggs cooked in masala gravy.",
        "calories": 450
      },
      {
        "id": 8,
        "title": "Fruit Salad",
        "description": "Mixed seasonal fruits served chilled.",
        "calories": 250
      },
      {
        "id": 9,
        "title": "Fried Rice",
        "description": "Rice fried with vegetables, egg, and soy sauce.",
        "calories": 500
      },
      {
        "id": 10,
        "title": "Mango Lassi",
        "description": "Sweet yogurt drink blended with ripe mango.",
        "calories": 300
      }
    ]
    ''';

    // Parse the JSON string into a list of maps
    final List<dynamic> jsonData = json.decode(jsonString);

    // Convert the list of maps to a list of Recipe objects
    setState(() {
      _recipes = jsonData.map((item) => Recipe.fromJson(item as Map<String, dynamic>)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Titles'),
      ),
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_recipes[index].title),
          );
        },
      ),
    );
  }
}