// ignore_for_file: avoid_print

// import 'package:chamber_of_commerce/add.dart';
// import 'package:chamber_of_commerce/detail.dart';
import 'package:chamber_of_commerce/Models/favorite_Item.dart';
import 'package:chamber_of_commerce/firebase_options.dart';
import 'package:chamber_of_commerce/navigation.dart';
import 'package:chamber_of_commerce/pages/admin/adminHome.dart';
import 'package:chamber_of_commerce/pages/user/Almanac.dart';
import 'package:chamber_of_commerce/pages/user/Business.dart';
import 'package:chamber_of_commerce/pages/user/Business_listing.dart';
import 'package:chamber_of_commerce/pages/user/Home.dart';
import 'package:chamber_of_commerce/theme/theme.dart';
import 'package:chamber_of_commerce/theme/theme_provider.dart';
import 'package:chamber_of_commerce/widgets/BottomNavBar.dart';
import 'package:chamber_of_commerce/widgets/GridScreen.dart';
import 'package:chamber_of_commerce/widgets/SearchMoreIcon.dart';
import 'package:chamber_of_commerce/widgets/TopNav.dart';
import 'package:chamber_of_commerce/widgets/expandedPanel.dart';
import 'package:chamber_of_commerce/widgets/filterResult.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:chamber_of_commerce/theme/MyFavoritesProvider.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Assuming you have initialized Firebase in your main function
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  var updateFavoritesBox = await Hive.openBox<FavoriteItem>('updateFavorites');
  // Box<FavoriteItem> favoriteItemsBox = await Hive.openBox<FavoriteItem>('newFavorites');

  // await Hive.openBox('newFavorites');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
        Provider<Box<FavoriteItem>>.value(value:updateFavoritesBox ) ,
       ChangeNotifierProvider<FavoriteListProvider>(
        
          create: (context) => FavoriteListProvider()..loadFavorites(),
        ),
        // Add other providers here
       ChangeNotifierProvider<ThemeProvider>( // Replace with your provider class
          create: (context) => ThemeProvider(),
        ),
       
    ],
  
  child:  MainApp()
  
  ));
}

class MainApp extends StatefulWidget {
  // final Box<FavoriteItem> newFavoritesBox;
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    
    debugShowCheckedModeBanner: false,
    
    theme: Provider.of<ThemeProvider>(context).themeData,
      
      // home:MyHomePage(),
      home:Home(),
     
     routes: routes,
  
  );
  }
}

