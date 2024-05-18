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
            _buildAssetsBlock(),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 200.0, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 11, // Number of favorite cards
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
      width: 150.0, // Width of each card
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
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
            change,
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: Icon(
                Icons.show_chart,
                size: 50.0,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetsBlock() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          Text(
            'Assets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          _buildAssetCard('Bitcoin', '\$55,678.32', '+4.23%'),
          _buildAssetCard('Ethereum', '\$2,986.87', '+6.78%'),
          _buildAssetCard('Ripple', '\$1.34', '-2.10%'),
          // Add other asset cards here
        ],
      ),
    );
  }

  Widget _buildAssetCard(String name, String price, String change) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
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
                  color: Colors.white,
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
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                change,
                style: TextStyle(
                  color: change.startsWith('+') ? Colors.green : Colors.red,
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
