import 'package:chamber_of_commerce/Models/favorite_Item.dart';

bool checkFavoriteExists(String name, List<FavoriteItem> favorites) {
  // Use a for loop to iterate through the favorites list
  for (var favorite in favorites) {
    // Compare the name property of each FavoriteItem with the provided name
    if (favorite.name == name) {
      // If a match is found, return true
      return true;
    }
  }

  // If no match is found after iterating through all items, return false
  return false;
}
