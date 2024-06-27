// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_Item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteAdapter extends TypeAdapter<FavoriteItem> {
  @override
  final int typeId = 0;

  @override
  FavoriteItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteItem(
      name: fields[0] as String,
      logo: fields[1] as String?,
      image: fields[2] as String?,
      video: fields[3] as String?,
      sub_sector: fields[4] as String?,
      sector: fields[5] as String?,
      profile: fields[6] as String?,
      tel: fields[7] as String?,
      mobile: fields[8] as String?,
      email: fields[9] as String?,
      category: fields[11] as String?,
      website: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteItem obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.logo)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.video)
      ..writeByte(4)
      ..write(obj.sub_sector)
      ..writeByte(5)
      ..write(obj.sector)
      ..writeByte(6)
      ..write(obj.profile)
      ..writeByte(7)
      ..write(obj.tel)
      ..writeByte(8)
      ..write(obj.mobile)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.website)
      ..writeByte(11)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
