import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final Color primaryColor = Color(0xFF5B4CF0);
final Color backgroundColor = Color(0xFF1B1A1F);
final Color cardBackgroundColor = Color(0xFF27262C);
final Color textColor = Color(0xFFFFFFFF);
final Color secondaryTextColor = Color(0xFFA1A1A6);
final Color accentColor = Color(0xFF3DD598);

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile; // To store the selected image

  // Function to show a modal bottom sheet for selecting image source
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: primaryColor),
                title: Text('Camera', style: TextStyle(color: textColor)),
                onTap: () {
                  _pickImage(ImageSource.camera); // Pick from camera
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: primaryColor),
                title: Text('Gallery', style: TextStyle(color: textColor)),
                onTap: () {
                  _pickImage(ImageSource.gallery); // Pick from gallery
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image using the image picker
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Store the selected image
      });
    }
  }

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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () => _showImageSourceActionSheet(context),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage('assets/profile_picture.jpg') as ImageProvider,
                  child: _imageFile == null
                      ? Icon(Icons.add_a_photo, size: 30.0, color: textColor)
                      : null, // Show add photo icon if no image is selected
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(color: secondaryTextColor),
                filled: true,
                fillColor: cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(color: secondaryTextColor),
                filled: true,
                fillColor: cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: secondaryTextColor),
                filled: true,
                fillColor: cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20.0),
            // Info Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: cardBackgroundColor,
              ),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: textColor),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Designed and Created by Mykola Kavetskyi',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                // Implement password change functionality
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, color: textColor),
                  const SizedBox(width: 10.0),
                  Text('Change Password', style: TextStyle(color: textColor)),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Implement logout functionality
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout, color: Colors.red),
                  const SizedBox(width: 10.0),
                  Text('Logout', style: TextStyle(color: Colors.red)),
                ],
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
    home: ProfileScreen(),
  ));
}