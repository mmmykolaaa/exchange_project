import 'package:flutter/material.dart';

// Колірна палітра
final Color primaryColor = const Color(0xFF5B4CF0);
final Color backgroundColor = const Color(0xFF1B1A1F);
final Color cardBackgroundColor = const Color(0xFF27262C);
final Color textColor = const Color(0xFFFFFFFF);
final Color secondaryTextColor = const Color(0xFFA1A1A6);
final Color accentColor = const Color(0xFF3DD598);

class JoinUsScreen extends StatelessWidget {
  const JoinUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor), // Змінено на непостійний вид
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Join Us',
          style: TextStyle(color: textColor), // Змінено на непостійний вид
        ),
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
                color: textColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Create your account',
              style: TextStyle(
                color: secondaryTextColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTextField('First Name'),
            const SizedBox(height: 20.0),
            _buildTextField('Last Name'),
            const SizedBox(height: 20.0),
            _buildTextField('Email'),
            const SizedBox(height: 20.0),
            _buildTextField('Password', obscureText: true),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (newValue) {
                    // Handle checkbox state change
                  },
                ),
                Expanded(
                  child: Text(
                    'I confirm that I am 18 years of age or older and\n'
                    'agree to the User Agreement and Privacy Policy',
                    style: TextStyle(color: secondaryTextColor), // Колір тексту
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign up button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Колір кнопки
                minimumSize: const Size(double.infinity, 50), // Розмір кнопки
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Закруглені кути кнопки
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: textColor), // Колір тексту кнопки
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Метод для створення полів вводу
  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: cardBackgroundColor, // Колір фону картки
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: textColor), // Білий текст
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textColor), // Колір тексту етикетки
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: JoinUsScreen(),
  ));
}