// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementList _$ElementListFromJson(Map<String, dynamic> json) => ElementList(
      Urls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementListToJson(ElementList instance) =>
    <String, dynamic>{
      'urls': instance.urls,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      full: json['full'] as String,
      regular: json['regular'] as String,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'full': instance.full,
      'regular': instance.regular,
    };
