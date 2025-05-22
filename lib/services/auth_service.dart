import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  // Getters
  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
  bool get isLoading => _isLoading;

  // Initialize service - check if user is already logged in
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('user');
      
      if (userData != null) {
        // Simulate loading the user from local storage
        await Future.delayed(const Duration(milliseconds: 500));
        // In a real app, you would deserialize the user data
        // _currentUser = User.fromJson(jsonDecode(userData));
      }
    } catch (e) {
      // Handle error
      debugPrint('Error initializing auth service: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Login with email and password
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API request
      await Future.delayed(const Duration(seconds: 1));
      
      // In a real app, you would make an API request to validate credentials
      if (email.isNotEmpty && password.isNotEmpty) {
        _currentUser = User(
          id: '1',
          name: 'John Doe',
          email: email,
          photoUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        );
        
        // Save user to preferences
        final prefs = await SharedPreferences.getInstance();
        // In a real app, you would serialize the user data
        // prefs.setString('user', jsonEncode(_currentUser!.toJson()));
        
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error logging in: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Register with email and password
  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API request
      await Future.delayed(const Duration(seconds: 1));
      
      // In a real app, you would make an API request to create a new user
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        _currentUser = User(
          id: '1',
          name: name,
          email: email,
          photoUrl: null,
        );
        
        // Save user to preferences
        final prefs = await SharedPreferences.getInstance();
        // In a real app, you would serialize the user data
        // prefs.setString('user', jsonEncode(_currentUser!.toJson()));
        
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error registering: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API request
      await Future.delayed(const Duration(milliseconds: 500));
      
      _currentUser = null;
      
      // Clear user from preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('user');
      
      notifyListeners();
    } catch (e) {
      debugPrint('Error logging out: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}