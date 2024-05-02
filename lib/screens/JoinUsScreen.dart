import 'package:flutter/material.dart';

class JoinUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1), 
      appBar: AppBar(
        backgroundColor: Colors.black, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Join Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Create your account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
             SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
           SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
          SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (newValue) {
                    // Handle checkbox state change
                  },
                ),
                Text(
                  'I confirm that I am 18 years of age or older and\n'
                  'agree to the User Agreement and Privacy Policy',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Зміна кольору кнопки на синій
                minimumSize: Size(double.infinity, 50), // Розмір кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Закруглені кути кнопки
                ),
              ),
              child: Text('Sign Up',
              style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: JoinUsScreen(),
  ));
}
