// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pixabay _$PixabayFromJson(Map<String, dynamic> json) => Pixabay(
      id: json['id'] as int,
      imgUrl: json['largeImageURL'] as String,
    );

Map<String, dynamic> _$PixabayToJson(Pixabay instance) => <String, dynamic>{
      'id': instance.id,
      'largeImageURL': instance.imgUrl,
    };
