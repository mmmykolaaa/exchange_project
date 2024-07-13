import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context), // передати context
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

  Widget _buildHeader(BuildContext context) { // прийняти context як параметр
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
          ),
          const Text(
            'Alex Butynets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info),
            color: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Info'),
                    content: const Text('Information about the app.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
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
        const SizedBox(height: 5.0),
        Text(
          action,
          style: const TextStyle(
            color: Colors.white,
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
          const Text(
            'Favorites',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
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
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
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
            style: const TextStyle(
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          const Text(
            'Assets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
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
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namu,
                style: const TextStyle(
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
                style: const TextStyle(
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

void main() => runApp(const MaterialApp(home: HomeScreen()));
