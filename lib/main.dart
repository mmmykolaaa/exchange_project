import 'package:flutter/material.dart';
import './screens/HomeScreen.dart'; 
import './screens/JoinUsScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInSignUpScreen(),
    );
  }
}

class SignInSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromRGBO(0, 0, 0, 1), 
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Зсув на 5% вниз
              Container(
                alignment: Alignment.topLeft, // Вирівнювання в лівому верхньому кутку
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue, // Заглушка під логотип
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 36, color: Colors.white), // Більший розмір шрифту
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(fontSize: 12, color: Colors.white70),
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
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 50), // Розмір кнопки
                ),
                child: Text('Sign In'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Google Sign In
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 50), // Розмір кнопки
                ),
                child: Text('Sign in with Google'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Sign In with Apple
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 50), // Розмір кнопки
                ),
                child: Text('Sign in with Apple'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Код для відновлення пароля
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Зсув на 5% вниз
              Spacer(), // Простір для розташування тексту внизу
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JoinUsScreen()),
                  );
                },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}