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
    _favorites.add(item);
    _favoritesBox.put('favorites',_favorites); // Save to Hive
  
    notifyListeners(); // Notify listeners of change
  }

  // Remove a favorite item
  void removeFromFavorites(FavoriteItem item) {
    _favorites.remove(item);
    // _favoritesBox.delete(item.name); // Delete from Hive
    _favoritesBox.delete(_favorites);
    notifyListeners();
  }
 
  // Load favorites from Hive on initialization
  Future<void> loadFavorites() async {
    //  _favorites = _favoritesBox.values.toList().cast<FavoriteItem>();
    _favorites = _favoritesBox.get(favorites)?.cast<FavoriteItem>() ?? [];;
    notifyListeners();
  }
// loadFavorites()
  @override
  void dispose() {
    _favoritesBox.close(); // Close the Hive box when provider is disposed
    super.dispose();
  }
}
