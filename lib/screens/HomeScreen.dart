import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'SearchScreen.dart'; // Імпорт SearchScreen

// Колірна палітра
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
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _buildMainContent(),
          SearchScreen(), // Ваш існуючий SearchScreen
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: cardBackgroundColor,
            width: 1.0,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _selectedIndex == 0 ? primaryColor : secondaryTextColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _selectedIndex == 1 ? primaryColor : secondaryTextColor),
              label: 'Search',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryTextColor,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return SafeArea(
      child: SingleChildScrollView(
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: const CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
          ),
          const SizedBox(width: 15.0),
          Text(
            'Alex Butynets',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
            ),
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
          const SizedBox(height: 5.0),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
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
          Text(
            'Assets',
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          _buildAssetCard('Bitcoin', '\$40,000', '+5%', true),
          _buildAssetCard('Ethereum', '\$3,000', '-2%', false),
          _buildAssetCard('Ripple', '\$1.00', '+10%', true),
        ],
      ),
    );
  }

  Widget _buildAssetCard(String name, String price, String change, bool isPositive) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
              const SizedBox(height: 5.0),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? accentColor : Colors.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}