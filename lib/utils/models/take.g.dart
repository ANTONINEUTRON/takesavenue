// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TakeImpl _$$TakeImplFromJson(Map<String, dynamic> json) => _$TakeImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  userId: json['userId'] as String,
  content: json['content'] as String,
  contenttype: $enumDecode(_$ContentTypeEnumMap, json['contenttype']),
  responder: json['responder'] as String,
  punishment: json['punishment'] as String,
  duration: (json['duration'] as num).toInt(),
  status: $enumDecode(_$TakeStatusEnumMap, json['status']),
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  expiresAt:
      json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
  likes: (json['likes'] as num?)?.toInt() ?? 0,
  shares: (json['shares'] as num?)?.toInt() ?? 0,
  agrees: (json['agrees'] as num?)?.toInt() ?? 0,
  disagrees: (json['disagrees'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$TakeImplToJson(_$TakeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userId': instance.userId,
      'content': instance.content,
      'contenttype': _$ContentTypeEnumMap[instance.contenttype]!,
      'responder': instance.responder,
      'punishment': instance.punishment,
      'duration': instance.duration,
      'status': _$TakeStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'likes': instance.likes,
      'shares': instance.shares,
      'agrees': instance.agrees,
      'disagrees': instance.disagrees,
    };

const _$ContentTypeEnumMap = {
  ContentType.text: 'text',
  ContentType.image: 'image',
  ContentType.video: 'video',
};

const _$TakeStatusEnumMap = {
  TakeStatus.pending: 'pending',
  TakeStatus.active: 'active',
  TakeStatus.completed: 'completed',
  TakeStatus.expired: 'expired',
};
