GlowApp – Skincare E-Commerce Mobile Application
Student Information

Name: Youvannroth
Course: Mobile Application Development

Project Description

" GlowApp is a mobile application that allows users to browse and purchase skincare products. The application provides a simple and user-friendly interface for customers to explore products, view details, and place orders."

The system consists of two main parts:

1. Flutter Mobile Application
2. Backend API (Laravel/PHP) connected to a MySQL database (Phpmyadmin)

Technologies Used
Frontend (Mobile App): Flutter, Dart
Backend: Laravel / PHP, REST API
Database: MySQL, phpMyAdmin

Project Structure
GlowApp
│
├── backend/        # Laravel API
├── flutter_app/    # Flutter mobile application
├── database.sql    # MySQL database
└── README.md

Main Features
1. User registration and login
2. Browse skincare products
3. View product details
4. Add products to cart
5. Place orders
6. Admin can manage products

Database Setup
1. Open phpMyAdmin
2. Create a new database named: glowapp_db
3. Import the file: database.sql
4. Running the Backend

Navigate to the backend folder:
1. cd backend
2. Install dependencies: composer install
3. Run the server: php artisan serve

Running the Flutter App
1. Navigate to the Flutter project folder: cd flutter_app
2. Install packages: flutter pub get
3. Run the app: flutter run

API Communication: The Flutter mobile application communicates with the backend through REST API to fetch product data, manage users, and process orders.

Youvannroth
Year: 2026
