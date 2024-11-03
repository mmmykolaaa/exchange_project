import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Ваші кольори
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
  DatabaseHelper dbHelper = DatabaseHelper(); // Ініціалізація DatabaseHelper
  List<String> _categories = ['ETFs', 'Technology', 'Crypto', 'All categories'];
  String _selectedCategory = 'All categories';
  List<Map<String, dynamic>> _recentSearches = []; // Список для недавніх пошуків
  List<Map<String, dynamic>> _searchResults = [];
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadRecentSearches(); // Завантажити недавні пошуки
    _searchController.addListener(() {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        _fetchCryptoData(_searchController.text); // Відправити запит
      });
    });
  }

  Future<void> _fetchCryptoData(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = []; // Очищення результатів, якщо запит порожній
      });
      return;
    }

    final url = 'https://api.coingecko.com/api/v3/search?query=$query'; // Використовуємо API для пошуку
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coins = data['coins']; // Отримуємо список криптовалют

      setState(() {
        _searchResults = coins.map((coin) => {
          'id': coin['id'],
          'symbol': coin['symbol'].toUpperCase(),
          'name': coin['name'],
          'image': coin['image'],
        }).toList();
      });
    } else {
      print('Помилка при отриманні даних: ${response.statusCode}');
    }
  }

 Widget _buildSearchResults() {
  return Column(
    children: _searchResults.map((result) {
      String imageUrl = result['image'] ?? ''; // Отримуємо URL зображення
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: imageUrl.isNotEmpty && Uri.parse(imageUrl).isAbsolute
              ? NetworkImage(imageUrl)
              : AssetImage ('assets/default_icon.png') as ImageProvider, // Запасне зображення
        ),
        title: Text(result['symbol'] ?? 'N/A'),
        subtitle: Text(result['name'] ?? 'Unknown'),
      );
    }).toList(),
  );
}

  Future<void> _loadRecentSearches() async {
    List<Map<String, dynamic>> searches = await dbHelper.getSearches();
    print('Recent Searches: $searches');
    setState(() {
      _recentSearches = searches.map((search) {
        return {
          'id': search['id'].toString(), // Зберігаємо id для видалення
          'symbol': search['symbol'] ?? '',
          'name': search['name'] ?? '',
          'image': search['image'] ?? '',
        };
      }).toList();
    });
  }

  // Додати новий пошук
  void _addRecentSearch(Map<String, String> search) {
    dbHelper.insertSearch(search);
    _loadRecentSearches(); // Перезавантажити список після додавання
  }

  // Видалення елемента з недавніх пошуків
  void _removeRecentSearch(int index) async {
    await dbHelper.deleteSearch(int.parse(_recentSearches[index]['id']!)); // Видалення з бази даних
    setState(() {
      _recentSearches.removeAt(index); // Видалення з локального списку
    });
  }

  // Оновлення обраної категорії
  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Відміняємо таймер, якщо він існує
    _searchController.dispose(); // Звільняємо ресурси контролера
    super.dispose(); // Викликаємо метод родительського класу
  }

  @override
  Widget build(BuildContext context) { // Метод build має бути тут
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
                    controller: _searchController,
                    cursorColor: primaryColor,
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: secondaryTextColor),
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: secondaryTextColor),
                    ),
                    onSubmitted: (value) {
                      // Додаємо новий пошук при натисканні Enter
                      if (value.isNotEmpty) {
                        print('Searching for: $value');
                        _fetchCryptoData(value);
                      }
                    },
                  ),
                ),
              ),
              // Відображення результатів пошуку
              const SizedBox(height: 20.0),
              _buildSearchResults(), // Додайте цей рядок
              // Інші віджети...
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
                        Map<String, dynamic> searchItem = entry.value;
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
                            searchItem['symbol'] ?? '',
                            searchItem['name'] ?? '',
                            searchItem['image'] ?? '',
                          ),
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
          backgroundImage: NetworkImage(
            imagePath.isNotEmpty ? imagePath : 'https://example.com/default_image.png', // Використання NetworkImage
          ),
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
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: secondaryTextColor,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}