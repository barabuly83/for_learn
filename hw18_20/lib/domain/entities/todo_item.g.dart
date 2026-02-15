// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoItemImpl _$$TodoItemImplFromJson(Map<String, dynamic> json) =>
    _$TodoItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TodoItemImplToJson(_$TodoItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'userId': instance.userId,
      'isCompleted': instance.isCompleted,
      'order': instance.order,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
