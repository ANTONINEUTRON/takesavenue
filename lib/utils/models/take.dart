import 'package:freezed_annotation/freezed_annotation.dart';

part 'take.freezed.dart';
part 'take.g.dart';

enum TakeStatus { pending, active, completed, expired }
enum ContentType { text, image, video }

@freezed
class Take with _$Take {
  const factory Take({
    required String id,
    required String title,
    required String userId,
    required String content,
    required ContentType contenttype,
    required String responder,
    required String punishment,
    required int duration,
    required TakeStatus status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @Default(0) int likes,
    @Default(0) int shares,
    @Default(0) int agrees,
    @Default(0) int disagrees,
  }) = _Take;

  factory Take.fromJson(Map<String, dynamic> json) => _$TakeFromJson(json);
}