import 'package:flutter/material.dart';
import './JoinUsScreen.dart'; // Імпортуємо клас JoinUsScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20.0),
            _buildActionsBlock(),
            SizedBox(height: 20.0),
            _buildFavoritesBlock(),
            SizedBox(height: 20.0),
            _buildPortfolioBlock(),
            SizedBox(height: 20.0),
            _buildJoinUsButton(), // Додаємо кнопку "Join Us"
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
          ),
          Text(
            'Alex Butynets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            color: Colors.white,
            onPressed: () {
              // Info icon handler
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionsBlock() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Додайте відступи тут
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    decoration: BoxDecoration(
      color: Colors.grey[900],
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
        color: Colors.white,
        size: 30.0,
      ),
      SizedBox(height: 5.0),
      Text(
        action,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}


 Widget _buildFavoritesBlock() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          onPressed: () {
            // Navigate to favorites screen
          },
        ),
      ],
    ),
  );
}

Widget _buildJoinUsButton(BuildContext context) { // Оновлений метод з параметром контексту
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JoinUsScreen()),
        );
      },
      child: Text(
        "Join Us",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        backgroundColor: Color.fromRGBO(20, 25, 36, 1), // Задній фон кнопки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}

Widget _buildPortfolioBlock() {
  return Container(
    height: 200.0,
    padding: EdgeInsets.only(left: 20.0),
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildAssetCard('Ethereum', '\$10,265.016', '+13.32%'),
        _buildAssetCard('XRP', '\$3,214.04', '+2.04%'),
        _buildAssetCard('Oleg', '\$2,713.87', '-1.00%'),
        _buildAssetCard('Kostya', '\$1,000.45', '+0.00%'),
        _buildAssetCard('Katya', '\$900.07', '-15.45%'),
        _buildAssetCard('Mykyta', '\$713.59', '-15.56%'),
        _buildAssetCard('Grygoriyi', '\$2,713.00', '-1.34%'),
        _buildAssetCard('Danya', '\$1,103.09', '+1.75%'),
        _buildAssetCard('Kyryl', '\$5,983.34', '+1.33%'),
        _buildAssetCard('Saveliyi', '\$2,787.54', '-1.88%'),
        _buildAssetCard('Artem', '\$6,093.56', '-14.65%'),
        _buildAssetCard('Juan', '\$798.88', '-100.84%'),
        _buildAssetCard('Dima', '\$9,713.55', '+200.56%'),
        // Add other cards here
      ],
    ),
  );
}



  Widget _buildJoinUsButton(BuildContext context) { // Додали параметр context
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JoinUsScreen()),
          );
        },
        child: Text(
          "Join Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          backgroundColor: Color.fromRGBO(20, 25, 36, 1), // Задній фон кнопки
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildAssetCard(String name, String price, String change) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              change,
              style: TextStyle(
                color: change.startsWith('+') ? Colors.green : Colors.red,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
