import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF5B4CF0);
final Color backgroundColor = Color(0xFF1B1A1F);
final Color cardBackgroundColor = Color(0xFF27262C);
final Color textColor = Color(0xFFFFFFFF);
final Color secondaryTextColor = Color(0xFFA1A1A6);
final Color accentColor = Color(0xFF3DD598);

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Закрити екран
                },
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                      children: [
                        _buildCategoryChip('ETFs', Color(0xFF4A5448)),
                        _buildCategoryChip('Technology', Color(0xFF364854)),
                        _buildCategoryChip('Crypto', Color(0xFF5D3A58)),
                        _buildCategoryChip('All categories', cardBackgroundColor),
                      ],
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
                    _buildRecentSearchItem('FIZZ', 'National Beverage Corp.', 'assets/fizz_logo.png'),
                    _buildRecentSearchItem('ROG', 'Rogers Corp.', 'assets/rog_logo.png'),
                    _buildRecentSearchItem('MCD', 'McDonald`s Corp', 'assets/mcd_logo.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
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
              // Дія для видалення цього елемента з нещодавніх пошуків
            },
            child: Icon(Icons.close, color: secondaryTextColor),
          ),
        ],
      ),
    );
  }
}