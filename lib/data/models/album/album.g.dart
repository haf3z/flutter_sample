// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
  (json['userId'] as num).toInt(),
  (json['id'] as num).toInt(),
  json['title'] as String,
);

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
  'userId': instance.userId,
  'id': instance.id,
  'title': instance.title,
};
