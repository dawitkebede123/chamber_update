import 'package:chamber_of_commerce/Models/favorite_Item.dart';
import 'package:flutter/material.dart';
import 'package:chamber_of_commerce/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Create a new provider class

class FavoriteListProvider extends ChangeNotifier {
  final _favoritesBox = Hive.box('newFavorites'); // Replace 'favorites' with your box name
  
  List<FavoriteItem> _favorites = [];

//  void didChangeDependencies() {
//     // super.didChangeDependencies();
//     loadFavorites();
//   }
  // Getter for the favorites list
  List<FavoriteItem> get favorites => _favorites;
  
 bool isFavorite( name){
  bool result = false; 
          for (var favorite in favorites) {
       if (favorite.name == name) {
      // If a match is found, return true
      result =  true;
    }
    else{
      result =  false;
    }
          }
          return result;
 }
  // _favorites.contains(name); // Check if an item is favorite

  // Add a favorite item
  void addToFavorites(FavoriteItem item) {
    Map<String, dynamic> data() => {
  'name': 'John Doe',
  'age': 30,
  // Add more key-value pairs as needed
};
  final key = UniqueKey(); // Generate a unique key
  _favorites.add(item);
   _favoritesBox.put(1, 'dawit'); // Save with unique key
  notifyListeners();
}


  // Remove a favorite item
  void removeFromFavorites(FavoriteItem item) {
    _favorites.remove(item);
    // _favoritesBox.delete(item.name); // Delete from Hive
    _favoritesBox.delete(item);
    notifyListeners();
  }
 
  // Load favorites from Hive on initialization
 Future<void> loadFavorites() async {
  final favorites = _favoritesBox.toMap().values.cast<Map<String, dynamic>>();
  _favorites = favorites.map((favorite) => fromJson(favorite)).toList();
  notifyListeners();
}

 static FavoriteItem fromJson(Map<String, dynamic> json) {
    // Implement the logic to create a FavoriteItem object from the JSON data
    // Replace the following with your actual deserialization logic
    return FavoriteItem(
      name: json['name'] as String,
      // Add other properties as needed, ensuring type safety
    );
  }
// loadFavorites()
  @override
  void dispose() {
    _favoritesBox.close(); // Close the Hive box when provider is disposed
    super.dispose();
  }
}
