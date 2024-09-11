import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Map<String, List<Map<String, String>>> categoryRecipes = {
    'Food Recipes': [
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/1107/816a/89a2fd72c4b07c0ba1bf9205ef03f786?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=VQVrMVRB0WhGDZvyUp7NMdes53OpITrAZ33OkWMkjWU8eKdakMoOMr33GZ-v6q9seLzSih1B2lnaFyUIa7RQxKLZKrgVLsWdohXfzBIIgT03Q3rvq57eAzxnJ5CIz-Uu8J1q-E54Is89L790OZSUOdxeTnwAHI7x-AP5cM1u3k4zg62DjMJB7ueP9hsk-wzqFeZjdQ3xz4xyoACUgK34TpgW0GwXRbrAux~9moyRhZQfF0-SSBnuBJQdKfrFJboQfGesDB0jB-HFjDcr6sWWaLMPOfUQ6vfQ5ImIQ4kIQwQsFH4YiMQrEoIJQklrRyq6Ec5ZvsUIQbSNadEoCLuoSg__',
        'title': 'Spaghetti Bolognese',
        'time': '30 min',
      },
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/3bdf/7101/f91a14d8d8d9750838af65b4fd6d14b9?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gx8aocL0ek-z2zyB8TXWqoAPHKpwiWCTPagQlhtTez79iLHRMyseQZcjujNHR4aMn7HtR1NMY1tp5-wjPB1BxJYq-jARPLyMMvatomB9IuZybUlViuPHrC5Jx1H8B22A74PqGubXH9ocYCZxjM4qFHsKEe7JJgjI5GdqEzTgC24Keiandv3l5j7esvkcvIKx56pWNb~zjM8RflBAAd-PjhqOpDk7iKc2a80eqD2a51jPw14RbMWmwOEIlrmeJyGs2QvbWPhlg17NFLnVohJkJTkuUzDIC-hSAXM-PBIrk67RhMbIJatLN9E7zYMcsrVqFrFzYSl8eOFBCLve6EoTTQ__',
        'title': 'Chicken Curry',
        'time': '45 min',
      },
    ],
    'Live': [
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/e544/a1d3/7e936546110e477556eb9b2f17ee2ce5?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IQPEIxYfhU6yF5eCwRBEFKnPloAF4J7FnqnRu1EPAKhn~j1FLywTK-Wb-iQzJaIGM4A-fxupYlGqGowZhAtn4R3RVYNXESBLkDNf5s3xuwRY1-dHobbXH8z0MBaGlqdKP3LLfEv3OmoNkF1gPiO6Uianr4YNLmKvhNn5T6cLh2OSIZm~YrOoLCctx8a8DvA7bSZIL0iunhy4NL-bfCP8AleNbWfmCACqtICHeyXICVyrtpPpLkD89bDtDxhQ8~Bg-bhjdfXgz4sfp0gTeSh~VnMHnjtlAmhQyOO9Y3o1XYjSTvtJ-KjJqZo6mouUiSOpdCMXQhyBCcrGkNAU6Ha8TQ__',
        'title': 'Cooking with Chef John',
        'time': '1 hr',
      },
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/217d/8fe4/59bcb435a114225d889d6ff2db284ec7?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GrU2WyJ9XNN2KrX9Wjs5jJKc1r1LQ0a8RgSRa8kS~7MFG0j~PqqDix4UTI22mMRdDTnkU7Y6uqwjrRi0YnOD9ztB9jEQTQ5p6FABOa-qodkZlrxQp16qEftw3YARuyGCyHKHc32w7nGuphbhVI7jA3BmYLLZxvQhPKRCjmtncyMmEUPb~QCH8RRmuDAkKuREhvSlCLKylb~pUN7B8twumGiQFLP5zeLXSF2Pb40bNly8NcqEinHR6S3ig72Va1h7Bf7G0QuNebL1zzxCnDKqbaE-YCADfEednmPamVJptJMs60aqS-PfBDOS69-hr4S5hfqDJH8DzFLc3HmYPRlsDg__',
        'title': 'Devilled whitebait and calamari',
        'time': '30 min',
      },
    ],
    'Galleries': [
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/0daa/b52d/a4a601fcf29b1efe44bee9fdc30cc326?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=d-JXcuhfuM4RxhM1XZGXhV4QwRKe~flLAFwpOSX2RLl~P08g1qI~JyEwdYoX0vN~auX~G6yE3M~2QFnt7MkUrBcqX~fnJx8UFwkT-~MPQmlN2FOe4yMwffzMcfZjCaQc8UgrrtYxJ4ItyW0uxbED0pmYgzFbtNUBdUGJUMBcU4bcjBD09ONgMUjg2YNO4DRVF7bDKKtQOWwytZvTxi~JwSIphkR2HzSa6gH-W65oVmfH6U9IhRWG9XFbUcPrXtDqVIJ18KZpZe8XK6K21M6G1fiGFgsx84bVQzhzaiytbr-pRbcqKohEuO5eHxXGtEit8gFwUXubySI2VZPxSwTHag__',
        'title': 'Food Gallery 1',
        'time': 'N/A',
      },
      {
        'imageUrl':
            'https://s3-alpha-sig.figma.com/img/7122/c784/4d18fbd46e50e73430eefc1f2949f465?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dAVrCtssudxzUub0vwFLBB24AuP2OCmVLlAzk~DEv7JYQvNFM0D6i3M0-FLfSk6nD0omwoDCO~PL-4IgqUtyGY9su7hlBUdQ7hOKXU0XBd7d39fEY8nQCgeB7ZpuArjfP7n4vMHN8yj4us-MeEVlepSs5zJ4TmPpJbZfF7ZAwkClWCIkv5dryfJPpjz3ODkj0Erg62fPUptB8dth~5iTeYIB4-COCLhsTX1NRZtb-W667kuTbJowEbEu~u0sB4Owy44Rd-V~DW~QUbI2Gc8Nw0gWDeBP3HoX8Ik03q5Oa7Rvu8bdqW8yhRE9os8bLV1dSS7uS2uLJCC1AlqpX07FeA__',
        'title': 'Food Gallery 2',
        'time': 'N/A',
      },
    ],
  };

  String selectedCategory = 'Food Recipes';
  late List<Map<String, String>> displayedRecipes;

  @override
  void initState() {
    super.initState();
    displayedRecipes = categoryRecipes[selectedCategory]!;
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
      displayedRecipes = categoryRecipes[selectedCategory]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for recipes...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Category Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryTab(
                  label: '🥙 Food Recipes',
                  isSelected: selectedCategory == 'Food Recipes',
                  onPressed: () => updateCategory('Food Recipes'),
                ),
                SizedBox(width: 10),
                CategoryTab(
                  label: '📹Live',
                  isSelected: selectedCategory == 'Live',
                  onPressed: () => updateCategory('Live'),
                ),
                SizedBox(width: 10),
                CategoryTab(
                  label: '📷 Galleries',
                  isSelected: selectedCategory == 'Galleries',
                  onPressed: () => updateCategory('Galleries'),
                ),
              ],
            ),
          ),
          // Recipe Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: displayedRecipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  imageUrl: displayedRecipes[index]['imageUrl']!,
                  title: displayedRecipes[index]['title']!,
                  time: displayedRecipes[index]['time']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryTab({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;

  const RecipeCard({
    required this.imageUrl,
    required this.title,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
