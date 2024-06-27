import 'package:hive/hive.dart';
part 'favorite_Item.g.dart';
@HiveType(typeId: 0,adapterName: 'FavoriteAdapter') // You can change the typeId if needed
class FavoriteItem {
  // Your model fields
  @HiveField(0)
  final String name;
   @HiveField(1)
  final String? logo;
   @HiveField(2)
  final String? image;
   @HiveField(3)
  final String? video; // nullable for optional video field
   @HiveField(4)
  final String? sub_sector;
   @HiveField(5)
  final String? sector;
   @HiveField(6)
  final String? profile;
   @HiveField(7)
  final String? tel;
    @HiveField(8)
  final String? mobile;
   @HiveField(9)
  final String? email;
   @HiveField(10)
  final String? website; // nullable for optional website field
   @HiveField(11)
  final String? category;

  FavoriteItem({
    required this.name,
     this.logo,
    this.image,
    this.video,
    this.sub_sector,
    this.sector,
    this.profile,
   this.tel,
   this.mobile,
     this.email,
    this.category,
    this.website,
  });
}
