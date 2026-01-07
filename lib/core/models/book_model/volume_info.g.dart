// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 1;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String?,
      authors: (fields[1] as List?)?.cast<String>(),
      publishedDate: fields[2] as String?,
      pageCount: fields[5] as int?,
      printType: fields[6] as String?,
      categories: (fields[7] as List?)?.cast<String>(),
      averageRating: fields[8] as double?,
      ratingsCount: fields[9] as int?,
      maturityRating: fields[10] as String?,
      allowAnonLogging: fields[11] as bool?,
      contentVersion: fields[12] as String?,
      imageLinks: fields[14] as ImageLinks?,
      language: fields[15] as String?,
      previewLink: fields[16] as String?,
      infoLink: fields[17] as String?,
      canonicalVolumeLink: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publishedDate)
      ..writeByte(5)
      ..write(obj.pageCount)
      ..writeByte(6)
      ..write(obj.printType)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.averageRating)
      ..writeByte(9)
      ..write(obj.ratingsCount)
      ..writeByte(10)
      ..write(obj.maturityRating)
      ..writeByte(11)
      ..write(obj.allowAnonLogging)
      ..writeByte(12)
      ..write(obj.contentVersion)
      ..writeByte(14)
      ..write(obj.imageLinks)
      ..writeByte(15)
      ..write(obj.language)
      ..writeByte(16)
      ..write(obj.previewLink)
      ..writeByte(17)
      ..write(obj.infoLink)
      ..writeByte(18)
      ..write(obj.canonicalVolumeLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
