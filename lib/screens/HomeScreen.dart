import 'package:flutter/material.dart';

// Відтінки кольорів
final Color primaryColor = Color(0xFF5B4CF0);
final Color backgroundColor = Color(0xFF1B1A1F);
final Color cardBackgroundColor = Color(0xFF27262C);
final Color textColor = Color(0xFFFFFFFF);
final Color secondaryTextColor = Color(0xFFA1A1A6);
final Color accentColor = Color(0xFF3DD598);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20.0),
            _buildActionsBlock(),
            const SizedBox(height: 20.0),
            _buildFavoritesBlock(),
            const SizedBox(height: 20.0),
            _buildAssetsBlock(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0), // Відступи від країв
        decoration: BoxDecoration(
          color: backgroundColor, // Фон контейнера
          borderRadius: BorderRadius.circular(15.0), // Округлення кутів
          border: Border.all(
            color: cardBackgroundColor, // Колір обводки
            width: 1.0,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Прозорий фон навігаційного бару
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? accentColor : secondaryTextColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _selectedIndex == 1 ? accentColor : secondaryTextColor),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz, color: _selectedIndex == 2 ? accentColor : secondaryTextColor),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, color: _selectedIndex == 3 ? accentColor : secondaryTextColor),
              label: 'History',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: accentColor,
          unselectedItemColor: secondaryTextColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed, // Щоб елементи не мінялися на мобільних пристроях
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0, // Забираємо тінь
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
          ),
          Text(
            'Alex Butynets',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
          ),
          IconButton(
            icon: Icon(Icons.info, color: textColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Info'),
                    content: Text('Information about the app.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionsBlock() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionItem('Deposit'),
          _buildActionItem('Withdraw'),
          _buildActionItem('Analytics'),
        ],
      ),
    );
  }

  Widget _buildActionItem(String action) {
    return Column(
      children: [
        Icon(
          action == 'Deposit'
              ? Icons.arrow_circle_up
              : action == 'Withdraw'
              ? Icons.arrow_circle_down
              : Icons.analytics,
          color: textColor,
          size: 30.0,
        ),
        const SizedBox(height: 5.0),
        Text(
          action,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFavoritesBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorites',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (context, index) {
                return _buildFavoriteCard('Asset $index', '\$${(index + 1) * 1000}', '+${index + 1}%', index.isEven ? true : false);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(String name, String price, String change, bool isPositive) {
    return Container(
      width: 150.0,
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            change,
            style: TextStyle(
              color: isPositive ? accentColor : Colors.red,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: Icon(
                Icons.show_chart,
                size: 50.0,
                color: isPositive ? accentColor : Colors.red,
              ),
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetsBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          Text(
            'Assets',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          _buildAssetCard('Bitcoin', '\$55,678.32', '+4.23%'),
          _buildAssetCard('Ethereum', '\$2,986.87', '+6.78%'),
          _buildAssetCard('Ripple', '\$1.34', '-2.10%'),
        ],
      ),
    );
  }

  Widget _buildAssetCard(String name, String price, String change) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                   ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.0,
                ),
              ),
              Text(
                change,
                style: TextStyle(
                  color: change.startsWith('+') ? accentColor : Colors.red,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: HomeScreen()));