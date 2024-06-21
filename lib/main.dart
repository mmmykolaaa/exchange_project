import 'package:flutter/material.dart';
import './screens/HomeScreen.dart'; 
import './screens/JoinUsScreen.dart';
import 'dart:developer';  //log, etc
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    //check if the user already has a stored profile
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());

    storage.read(key: 'user')
      .then((user) => {
        if(user == null) {
          log('user is absent in storage')
        } else {
          log('found user $user')
        } })
      .catchError((e) => log('failed to get user: $e'));

    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInSignUpScreen(),
    );
  }
}

class SignInSignUpScreen extends StatelessWidget {
  const SignInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromRGBO(0, 0, 0, 1), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              const SizedBox(height: 10),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 36, color: Colors.white), // Більший розмір шрифту
              ),
              const Text(
                'Please sign in to continue',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[900],
                ),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Розмір кнопки
                ),
                child: const Text('Sign In',
                style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Google Sign In
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Розмір кнопки
                ),
                child: const Text('Sign in with Google',
                style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Sign In with Apple
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Розмір кнопки
                ),
                child: const Text('Sign in with Apple',
                style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Код для відновлення пароля
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Зсув на 5% вниз
              const Spacer(), // Простір для розташування тексту внизу
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JoinUsScreen()),
                  );
                },
              child: const Text(
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