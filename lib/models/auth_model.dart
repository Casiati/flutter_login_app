import 'package:flutter/foundation.dart';

class AuthModel with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> login() async {
    _isLoading = true;
    notifyListeners(); 

    await Future.delayed(const Duration(seconds: 2)); 

    _isLoggedIn = true; 
    _isLoading = false; 
    notifyListeners(); 
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
