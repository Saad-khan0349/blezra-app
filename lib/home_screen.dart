import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'favorites_manager.dart'; // ✅ import this

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'iPhone 12',
      'price': 765.00,
      'image': 'images/pngs/phone.webp',
      'bg': const Color(0xFFE8F1FF),
    },
    {
      'name': 'Yellow Hoodie',
      'price': 69.00,
      'image': 'images/pngs/hoodie.jpg',
      'bg': const Color(0xFFFFF4E0),
    },
    {
      'name': 'Perfume',
      'price': 350.00,
      'image': 'images/pngs/perfume2.jpg',
      'bg': const Color(0xFFEFF9E9),
    },
    {
      'name': 'Men Shoes',
      'price': 450.00,
      'image': 'images/pngs/shoes.webp',
      'bg': const Color(0xFFF3F1FF),
    },
    {
      'name': 'Apple watch',
      'price': 265.00,
      'image': 'images/pngs/wrong_image.jpg',
      'bg': const Color(0xFFE8F1FF),
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/pngs/hor.png', height: 60),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🖼️ Carousel
            CarouselSlider(
              items: products.map((p) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        p['image'],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.grey,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
            ),

            const SizedBox(height: 15),

            // 🔘 Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: products.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.deepOrangeAccent
                        : Colors.grey[400],
                  ),
                );
              }).toList(),
            ),

            // 📝 Recommendation Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 🧱 Grid Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.65,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🧩 Product Card Widget
  Widget _buildProductCard(Map<String, dynamic> product) {
    final isFavorite = favoritesManager.isFavorite(product);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: product['bg'],
                child: Center(
                  child: Image.asset(
                    product['image'],
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.deepOrangeAccent,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    favoritesManager.toggleFavorite(product);
                  });
                },
                splashRadius: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            product['name'],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product['price'].toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                minimumSize: const Size(0, 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                "Buy",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
