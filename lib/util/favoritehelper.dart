//   import 'package:chamber_of_commerce/Models/favorite_Item.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// Future<void> checkFavorite( String? targetValue) async {
//   final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
//   // var box = await Hive.openBox(boxName);
//     //  final _favoritesBox = Hive.box('newFavorites');

//   // await _favoritesBox.(() async {
//     for (var key in newFavoritesBox.keys) {
//       if (newFavoritesBox.get(key)!.name == targetValue) {
//         // await newFavoritesBox.delete(key);
//         isFavorite = true;
//       }
//     }
//   // }
//   // );
// }
// Future<void> addByValue( String? targetValue) async {
//    final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
//   // var box = await Hive.openBox(boxName);
//     //  final _favoritesBox = Hive.box('newFavorites');

//   // await _favoritesBox.(() async {
//     for (var key in newFavoritesBox.keys) {
//       if (newFavoritesBox.get(key)!.name == targetValue) {
//         await newFavoritesBox.add(key);
//       }
//     }
//   // }
//   // );
// }
// Future<void> deleteByValue( String? targetValue) async {
//    final newFavoritesBox = Provider.of<Box<FavoriteItem>>(context);
//   // var box = await Hive.openBox(boxName);
//     //  final _favoritesBox = Hive.box('newFavorites');

//   // await _favoritesBox.(() async {
//     for (var key in newFavoritesBox.keys) {
//       if (newFavoritesBox.get(key)!.name == targetValue) {
//         await newFavoritesBox.delete(key);
//       }
//     }
//   // }
//   // );
// }