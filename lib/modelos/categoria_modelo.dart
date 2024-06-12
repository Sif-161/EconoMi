import 'package:flutter/foundation.dart';
class CategoriaModelo with ChangeNotifier {
  String _selectedCategory = '';

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String value) {
    _selectedCategory = value;
    notifyListeners(); 
  }
}