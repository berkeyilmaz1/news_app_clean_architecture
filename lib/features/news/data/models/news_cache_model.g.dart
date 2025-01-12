// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsCacheModelAdapter extends TypeAdapter<NewsCacheModel> {
  @override
  final int typeId = 0;

  @override
  NewsCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsCacheModel(
      query: fields[0] as String,
      news: (fields[1] as List).cast<NewsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.query)
      ..writeByte(1)
      ..write(obj.news);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
