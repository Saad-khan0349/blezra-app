import 'package:flutter/material.dart';
import 'favorites_manager.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    favoritesManager.addListener(_onFavoritesChanged);
  }

  void _onFavoritesChanged() => setState(() {});

  @override
  void dispose() {
    favoritesManager.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = favoritesManager.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:
          // no favorites
          favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet ❤️",
                style: TextStyle(fontSize: 18),
              ),
            )
          :
            // show favorites list
            ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return ListTile(
                  leading: Image.asset(
                    item['image'],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) =>
                        const Icon(Icons.broken_image, size: 40),
                  ),
                  title: Text(item['name']),
                  subtitle: Text("\$${item['price']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      favoritesManager.toggleFavorite(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}
