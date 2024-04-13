import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'), // Profile image
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
          ),
          SizedBox(height: 20.0),
          _buildAssetCard('Bitcoin', '\$36,641.20', '+0.3%'),
          _buildAssetCard('Ethereum', '\$28,312.20', '+0.7%'),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Portfolio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20.0),
              children: [
                _buildAssetCard('Ethereum', '\$2,814.29', '+11.5%'),
                _buildAssetCard('Solana', '\$85.91', '-1.54%'),
                // Add other cards here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCard(String name, String price, String change) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              change,
              style: TextStyle(
                color: change.startsWith('+') ? Colors.green : Colors.red,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
