// lib/favorites_manager.dart
import 'package:flutter/material.dart';

class FavoritesManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(Map<String, dynamic> item) {
    final existingIndex = _favorites.indexWhere(
      (fav) => fav['name'] == item['name'],
    );
    if (existingIndex >= 0) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> item) {
    return _favorites.any((fav) => fav['name'] == item['name']);
  }
}

// A global instance that can be shared easily
final FavoritesManager favoritesManager = FavoritesManager();
