import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF5B4CF0);
final Color backgroundColor = Color(0xFF1B1A1F);
final Color cardBackgroundColor = Color(0xFF27262C);
final Color textColor = Color(0xFFFFFFFF);
final Color secondaryTextColor = Color(0xFFA1A1A6);
final Color accentColor = Color(0xFF3DD598);

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _categories = ['ETFs', 'Technology', 'Crypto', 'All categories'];
  String _selectedCategory = 'All categories';

  List<Map<String, String>> _recentSearches = [
    {'symbol': 'FIZZ', 'name': 'National Beverage Corp.', 'image': 'assets/fizz_logo.png'},
    {'symbol': 'ROG', 'name': 'Rogers Corp.', 'image': 'assets/rog_logo.png'},
    {'symbol': 'MCD', 'name': 'McDonald`s Corp', 'image': 'assets/mcd_logo.png'},
  ];

  // Видалення елемента з недавніх пошуків
  void _removeRecentSearch(int index) {
    setState(() {
      _recentSearches.removeAt(index);
    });
  }

  // Оновлення обраної категорії
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Приховати клавіатуру при натисканні на пусте місце
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false, // Видалити кнопку назад
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Discover',
              style: TextStyle(
                color: textColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), 
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    cursorColor: primaryColor,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: secondaryTextColor),
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: secondaryTextColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: _categories.map((category) {
                        return GestureDetector(
                          onTap: () => _selectCategory(category),
                          child: _buildCategoryChip(category, _selectedCategory == category),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      'Recent searches',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      children: _recentSearches.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> searchItem = entry.value;
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            _removeRecentSearch(index); // Видалення елемента
                          },
                          background: Container(
                            padding: const EdgeInsets.only(right: 20.0),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          child: _buildRecentSearchItem(
                              searchItem['symbol']!, searchItem['name']!, searchItem['image']!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : cardBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? backgroundColor : textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRecentSearchItem(String symbol, String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20.0,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                symbol,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                name,
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Можна додати додаткові дії при натисканні, якщо потрібно
            },
            child: Icon(Icons.close, color: secondaryTextColor),
          ),
        ],
      ),
    );
  }
}