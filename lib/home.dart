import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'category.dart'; // Import the CategoryScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> savedArticles = []; // Store saved articles

  // Toggle save/unsave articles
  void toggleSaveArticle(Map<String, dynamic> article) {
    setState(() {
      if (savedArticles.contains(article)) {
        savedArticles.remove(article);
      } else {
        savedArticles.add(article);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'label': 'Business', 'value': 'business', 'icon': '💼'},
      {'label': 'Entertainment', 'value': 'entertainment', 'icon': '🎭'},
      {'label': 'General', 'value': 'general', 'icon': '🌍'},
      {'label': 'Health', 'value': 'health', 'icon': '⚕️'},
      {'label': 'Science', 'value': 'science', 'icon': '🔬'},
      {'label': 'Sports', 'value': 'sports', 'icon': '🏅'},
      {'label': 'Technology', 'value': 'technology', 'icon': '💻'},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: const Text(
          'News Categories',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White text for the title
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Placeholder for search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Search functionality coming soon!")),
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xFF055975),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two categories per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      category: category['value']!,
                      title: category['label']!,
                      savedArticles: savedArticles,
                      toggleSave:
                          toggleSaveArticle, // Pass toggle save function
                    ),
                  ),
                );
              },
              child: CategoryCard(
                title: category['label']!,
                icon: category['icon']!,
                backgroundColor: Colors.blueGrey[50]!,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(
                category: "saved",
                title: "Saved News",
                savedArticles: savedArticles,
                toggleSave: toggleSaveArticle, // Pass toggle save function
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFF055975),
        child: const Icon(Icons.bookmark, color: Colors.white),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
