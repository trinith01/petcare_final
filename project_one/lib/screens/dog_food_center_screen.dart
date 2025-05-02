import 'package:flutter/material.dart';

class DogFoodStoreScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Premium Dog Food',
      'description': 'High-quality dog food for all breeds',
      'price': '\$25.99',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Organic Dog Treats',
      'description': 'Healthy and organic treats for your dog',
      'price': '\$14.49',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Puppy Starter Pack',
      'description': 'Essential food items for puppies',
      'price': '\$19.99',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Grain-Free Dog Food',
      'description': 'Perfect for dogs with grain allergies',
      'price': '\$23.75',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Dental Chews',
      'description': 'Helps maintain your dog’s dental health',
      'price': '\$10.50',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Weight Management Food',
      'description': 'Specially formulated for overweight dogs',
      'price': '\$27.30',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Senior Dog Food',
      'description': 'Nutritional food for senior dogs',
      'price': '\$24.20',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Energy Boost Food',
      'description': 'For active and energetic dogs',
      'price': '\$21.99',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Skin & Coat Food',
      'description': 'Promotes healthy skin and shiny coat',
      'price': '\$18.80',
      'image': 'https://via.placeholder.com/80'
    },
    {
      'name': 'Vegetarian Dog Food',
      'description': 'Plant-based food for dogs',
      'price': '\$22.49',
      'image': 'https://via.placeholder.com/80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Center",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF4CAF50), // Green theme
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12.0),
                // leading: ClipRRect(
                //   borderRadius: BorderRadius.circular(8),
                //   child: Image.network(
                //     item['image']!,
                //     width: 60,
                //     height: 60,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                title: Text(
                  item['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['description']!),
                    SizedBox(height: 4),
                    Text(
                      item['price']!,
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Color(0xFF4CAF50)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added ${item['name']} to cart')),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
