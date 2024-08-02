import 'package:flutter/material.dart';

// Колірна палітра
final Color primaryColor = const Color(0xFF5B4CF0);
final Color backgroundColor = const Color(0xFF1B1A1F);
final Color cardBackgroundColor = const Color(0xFF27262C);
final Color textColor = const Color(0xFFFFFFFF);
final Color secondaryTextColor = const Color(0xFFA1A1A6);
final Color accentColor = const Color(0xFF3DD598);

class JoinUsScreen extends StatefulWidget {
  const JoinUsScreen({super.key});

  @override
  _JoinUsScreenState createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  bool isChecked = false;
  bool isPasswordVisible = false;
  bool isPasswordVerificationVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
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
              _buildPasswordTextField('Password', isPasswordVisible, () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              }),
              const SizedBox(height: 20.0),
              _buildPasswordTextField('Verify Password', isPasswordVerificationVisible, () {
                setState(() {
                  isPasswordVerificationVisible = !isPasswordVerificationVisible;
                });
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I confirm that I am 18 years of age or older and\n'
                      'agree to the User Agreement and Privacy Policy',
                      style: TextStyle(color: secondaryTextColor),
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
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: textColor),
                ),
              ),
            ],
          ),
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
        color: cardBackgroundColor,
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(String label, bool isVisible, VoidCallback onToggleVisibility) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: cardBackgroundColor,
      ),
      child: TextField(
        obscureText: !isVisible,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: textColor,
            ),
            onPressed: onToggleVisibility,
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