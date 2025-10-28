import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🛍 Dummy cart data (added 2 more items)
    final List<Map<String, dynamic>> items = [
      {
        'name': 'Tactical Uniform Hat',
        'price': 42.95,
        'quantity': 1,
        'image': 'images/pngs/hat2.jpg',
        'bg': Colors.blue.shade50,
      },
      {
        'name': 'Branded Perfume',
        'price': 399.98,
        'quantity': 2,
        'image': 'images/pngs/perfume.jpg',
        'bg': Colors.yellow.shade50,
      },
      {
        'name': 'Gray Sneaker',
        'price': 33.50,
        'quantity': 1,
        'image': 'images/pngs/sneaker.webp',
        'bg': Colors.green.shade50,
      },
      {
        'name': 'Black Leather Wallet',
        'price': 28.75,
        'quantity': 1,
        'image': 'images/pngs/wallet.webp',
        'bg': Colors.purple.shade50,
      },
      {
        'name': 'Classic Sports Watch',
        'price': 59.90,
        'quantity': 1,
        'image': 'images/pngs/watch.jpg',
        'bg': Colors.orange.shade50,
      },
    ];

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0.5,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🧺 Cart Items Section (slightly smaller height than half)
            SizedBox(
              height: screenHeight * 0.45, // slightly less than half
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 🖼 Image (fills left side better)
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: item['bg'] as Color,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(
                            //   color: Colors.grey.withOpacity(0.3),
                            // ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage(item['image'] as String),
                              fit: BoxFit.cover, // fills the container fully
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // 🧾 Product details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "x${item['quantity']}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 💰 Price
                        Text(
                          "\$${item['price']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // 📊 Total Label
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // 💵 Total Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Products", style: TextStyle(fontSize: 15)),
                      Text(
                        "\$212.08",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount", style: TextStyle(fontSize: 15)),
                      Text(
                        "-\$18.44",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$193.64",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🖤 Payment & Continue Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Pay via Card — \$193.64"),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Continue shopping",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24), // more space so button isn’t cut off
          ],
        ),
      ),
    );
  }
}
