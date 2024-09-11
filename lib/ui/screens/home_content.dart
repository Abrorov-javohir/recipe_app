import 'package:flutter/material.dart';
import 'package:recipe_app/core/gen/assets.gen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and Search Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    ), // Replace with your profile image URL
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            // Categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryChip(label: '🍲Soup'),
                  CategoryChip(label: '🦐Seafood'),
                  CategoryChip(label: '🍣Sushi'),
                ],
              ),
            ),
            // Live Cooking
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Live Cooking",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Assets.svg.category.svg()
                  ],
                )),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  LiveCookingCard(
                    label: 'Devilled whitebait and calamari',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    author: 'Alica Keena',
                    commentsCount: 2,
                  ), // Replace with actual image
                  LiveCookingCard(
                    label: 'Baked chicken',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    author: 'Alica Keena',
                    commentsCount: 2,
                  ),
                ],
              ),
            ),
            // Top Chef
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Top Chef",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ChefCard(
                    name: 'Amato',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    recipesCount: 8,
                  ),
                  ChefCard(
                    name: 'Sartana',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    recipesCount: 8,
                  ), // Replace with actual image
                  ChefCard(
                    name: 'John S.',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    recipesCount: 8,
                  ), // Replace with actual image
                  ChefCard(
                    name: 'Miller',
                    imageUrl:
                        'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                    recipesCount: 8,
                  ), // Replace with actual image
                ],
              ),
            ),
            // Popular Recipes
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Popular Recipes",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: 4, // Adjust as necessary
              itemBuilder: (context, index) {
                return const RecipeCard(
                  imageUrl:
                      'https://s3-alpha-sig.figma.com/img/d1f8/c936/acd2c31a05014e1dc3599964d5e2d988?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AmWl5bE4Iq3nLHMiPYWxuLmGTPC19SD-8WgekpJaeQAHeh9q3ivR8OYEf2uI1J0cm7rsgGTGCPMVOYOdl6EFx09Uoagjufc3kt5LQeSbjCZYhCi-6eQ0BS~XcgzriCFtFB2Yay-9ylt0YJAYZuWt49tLcHjrJSc52oYADwAKGrqTqKbhfjJ4BJ5RxiA3t~1pojSZYPD70nt7ZNYH~4-OiXHkHmWoQDUwkzeD8i9O7-q6YTo4Wkkt6KWe8YJpLY7F4dDapsae4CJ3yyTUlijHELj7UQRSfr9J-42OybQd9Qa5FXTTlxKL0ZJhWDuliCawCExryjwEEfO81ul4EOtwrg__',
                ); // Replace with actual image
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.teal[100],
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}

class LiveCookingCard extends StatelessWidget {
  final String label;
  final String imageUrl;
  final String author; // Muallif nomi
  final int commentsCount; // Izohlar soni

  const LiveCookingCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.author,
    required this.commentsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(imageUrl, height: 120, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                author,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '+$commentsCount comments',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChefCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int recipesCount; // Retseptlar soni

  const ChefCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.recipesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: SizedBox(
        width: 100,
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 60, // O'lchamni belgilash
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              '$recipesCount Recipes',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;

  const RecipeCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(imageUrl, height: 100, fit: BoxFit.cover),
            const SizedBox(height: 8),
            const Center(child: Text("Recipe Item")),
          ],
        ),
      ),
    );
  }
}
