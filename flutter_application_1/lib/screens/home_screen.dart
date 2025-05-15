import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';
  String _sortBy = 'name';

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Classic Shrek Meme T-Shirt',
      description: 'A comfortable cotton t-shirt.',
      price: 29.99,
      imageUrl: 'assets/images/tshirt.jpg',
      categories: ['Clothing', 'T-Shirts'],
      options: {
        'size': ['S', 'M', 'L', 'XL'],
        'color': ['White', 'Black', 'Gray'],
      },
      rating: 4.5,
    ),
    Product(
      id: '2',
      name: 'Shrocks',
      description: 'High-performance shrek Crocs.',
      price: 89.99,
      imageUrl: 'assets/images/shoes.jpg',
      categories: ['Shoes', 'Sports'],
      options: {
        'size': ['7', '8', '9', '10', '11'],
        'color': ['Black/Green', 'Green/Green', 'Gray/Green'],
      },
      rating: 4.8,
    ),
    Product(
      id: '3',
      name: 'Shrek Leather Wallet',
      description: 'Genuine leather wallet with multiple card slots.',
      price: 49.99,
      imageUrl: 'assets/images/wallet.jpg',
      categories: ['Accessories'],
      options: {
        'color': ['Brown', 'Black', 'Green'],
      },
      rating: 4.3,
    ),
    Product(
      id: '4',
      name: 'Shrek Smart Watch',
      description: 'Feature-rich smartwatch with health tracking capabilities.',
      price: 199.99,
      imageUrl: 'assets/images/smartwatch.jpg',
      categories: ['Electronics', 'Accessories'],
      options: {
        'color': ['Black', 'Green', 'Gray'],
      },
      rating: 4.6,
    ),
  ];

  List<Product> get filteredProducts {
    return products.where((product) {
      if (_selectedCategory == 'All') return true;
      return product.categories.contains(_selectedCategory);
    }).toList()
      ..sort((a, b) {
        switch (_sortBy) {
          case 'price':
            return a.price.compareTo(b.price);
          case 'rating':
            return (b.rating ?? 0).compareTo(a.rating ?? 0);
          default:
            return a.name.compareTo(b.name);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Secret Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedCategory,
                    items: ['All', 'Clothing', 'T-Shirts', 'Accessories']
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _sortBy,
                    items: const [
                      DropdownMenuItem(
                        value: 'name',
                        child: Text('Sort by Name'),
                      ),
                      DropdownMenuItem(
                        value: 'price',
                        child: Text('Sort by Price'),
                      ),
                      DropdownMenuItem(
                        value: 'rating',
                        child: Text('Sort by Rating'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _sortBy = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ProductGridItem(
                  product: filteredProducts[index],
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/product',
                    arguments: filteredProducts[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
