import 'dart:math';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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

  Widget _buildPortfolioBlock() {
    return Container(
      height: 200.0,
      padding: EdgeInsets.only(left: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAssetCard('Bitcoin', '\$55,678.32', '+4.23%'),
          _buildAssetCard('Ethereum', '\$2,986.87', '+6.78%'),
          _buildAssetCard('Ripple', '\$1.34', '-2.10%'),
          _buildAssetCard('Cardano', '\$1.23', '+8.92%'),
          _buildAssetCard('Dogecoin', '\$0.34', '+12.45%'),
          _buildAssetCard('Polkadot', '\$40.67', '-0.78%'),
          _buildAssetCard('Litecoin', '\$235.89', '+3.56%'),
          _buildAssetCard('Chainlink', '\$50.09', '-1.24%'),
          _buildAssetCard('Stellar', '\$0.78', '+5.67%'),
          _buildAssetCard('VeChain', '\$0.15', '-0.32%'),
          // Add other cards here
        ],
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

