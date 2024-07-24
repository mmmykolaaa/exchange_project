import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/JoinUsScreen.dart';
import 'dart:developer';  // log, etc
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Визначення кольорів
final Color primaryColor = Color(0xFF5B4CF0);
final Color backgroundColor = Color(0xFF1B1A1F);
final Color cardBackgroundColor = Color(0xFF27262C);
final Color textColor = Color(0xFFFFFFFF);
final Color secondaryTextColor = Color(0xFFA1A1A6);
final Color accentColor = Color(0xFF3DD598);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Перевірка, чи вже є збережений профіль користувача
    AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    final storage = FlutterSecureStorage(aOptions: getAndroidOptions());

    storage.read(key: 'user')
      .then((user) {
        if (user == null) {
          log('user is absent in storage');
        } else {
          log('found user $user');
        }
      })
      .catchError((e) => log('failed to get user: $e'));

    return MaterialApp(
      title: 'Exchanger',
      theme: ThemeData(
        primarySwatch: MaterialColor(primaryColor.value, {
          50: primaryColor.withOpacity(0.1),
          100: primaryColor.withOpacity(0.2),
          200: primaryColor.withOpacity(0.3),
          300: primaryColor.withOpacity(0.4),
          400: primaryColor.withOpacity(0.5),
          500: primaryColor.withOpacity(0.6),
          600: primaryColor.withOpacity(0.7),
          700: primaryColor.withOpacity(0.8),
          800: primaryColor.withOpacity(0.9),
          900: primaryColor.withOpacity(1.0),
        }),
        scaffoldBackgroundColor: backgroundColor,
        cardColor: cardBackgroundColor,
        textTheme: TextTheme(
          displayLarge: TextStyle(color: textColor),
          displayMedium: TextStyle(color: textColor),
          displaySmall: TextStyle(color: textColor),
          headlineLarge: TextStyle(color: textColor),
          headlineMedium: TextStyle(color: textColor),
          headlineSmall: TextStyle(color: textColor),
          titleLarge: TextStyle(color: textColor),
          titleMedium: TextStyle(color: textColor),
          titleSmall: TextStyle(color: textColor),
          bodyLarge: TextStyle(color: textColor),
          bodyMedium: TextStyle(color: secondaryTextColor),
          bodySmall: TextStyle(color: secondaryTextColor),
          labelLarge: TextStyle(color: textColor),
          labelMedium: TextStyle(color: textColor),
          labelSmall: TextStyle(color: secondaryTextColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            minimumSize: const Size(double.infinity, 50), // Розмір кнопки
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
          ),
        ),
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
      backgroundColor: backgroundColor,
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
                  color: primaryColor, // Заглушка під логотип
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Welcome',
                style: TextStyle(fontSize: 36, color: textColor), // Більший розмір шрифту
              ),
              Text(
                'Please sign in to continue',
                style: TextStyle(fontSize: 12, color: secondaryTextColor),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity, // Повне використання доступного простору в ширину
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: cardBackgroundColor,
                ),
                child: TextField(
                  style: TextStyle(color: textColor), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                  color: cardBackgroundColor,
                ),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: textColor), // Білий текст
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                child: Text('Sign In',
                  style: TextStyle(color: textColor),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Google Sign In
                },
                child: Text('Sign in with Google',
                  style: TextStyle(color: textColor),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Код для Sign In with Apple
                },
                child: Text('Sign in with Apple',
                  style: TextStyle(color: textColor),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Код для відновлення пароля
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: textColor,
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
            Text(
              "Don't have an account? ",
              style: TextStyle(color: textColor),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinUsScreen()),
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: primaryColor,
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