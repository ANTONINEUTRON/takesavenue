// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'take.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Take _$TakeFromJson(Map<String, dynamic> json) {
  return _Take.fromJson(json);
}

/// @nodoc
mixin _$Take {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  ContentType get contenttype => throw _privateConstructorUsedError;
  String get responder => throw _privateConstructorUsedError;
  String get punishment => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  TakeStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get shares => throw _privateConstructorUsedError;
  int get agrees => throw _privateConstructorUsedError;
  int get disagrees => throw _privateConstructorUsedError;

  /// Serializes this Take to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Take
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TakeCopyWith<Take> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TakeCopyWith<$Res> {
  factory $TakeCopyWith(Take value, $Res Function(Take) then) =
      _$TakeCopyWithImpl<$Res, Take>;
  @useResult
  $Res call({
    String id,
    String title,
    String userId,
    String content,
    ContentType contenttype,
    String responder,
    String punishment,
    int duration,
    TakeStatus status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    int likes,
    int shares,
    int agrees,
    int disagrees,
  });
}

/// @nodoc
class _$TakeCopyWithImpl<$Res, $Val extends Take>
    implements $TakeCopyWith<$Res> {
  _$TakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Take
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? content = null,
    Object? contenttype = null,
    Object? responder = null,
    Object? punishment = null,
    Object? duration = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? likes = null,
    Object? shares = null,
    Object? agrees = null,
    Object? disagrees = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            content:
                null == content
                    ? _value.content
                    : content // ignore: cast_nullable_to_non_nullable
                        as String,
            contenttype:
                null == contenttype
                    ? _value.contenttype
                    : contenttype // ignore: cast_nullable_to_non_nullable
                        as ContentType,
            responder:
                null == responder
                    ? _value.responder
                    : responder // ignore: cast_nullable_to_non_nullable
                        as String,
            punishment:
                null == punishment
                    ? _value.punishment
                    : punishment // ignore: cast_nullable_to_non_nullable
                        as String,
            duration:
                null == duration
                    ? _value.duration
                    : duration // ignore: cast_nullable_to_non_nullable
                        as int,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TakeStatus,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            expiresAt:
                freezed == expiresAt
                    ? _value.expiresAt
                    : expiresAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            likes:
                null == likes
                    ? _value.likes
                    : likes // ignore: cast_nullable_to_non_nullable
                        as int,
            shares:
                null == shares
                    ? _value.shares
                    : shares // ignore: cast_nullable_to_non_nullable
                        as int,
            agrees:
                null == agrees
                    ? _value.agrees
                    : agrees // ignore: cast_nullable_to_non_nullable
                        as int,
            disagrees:
                null == disagrees
                    ? _value.disagrees
                    : disagrees // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TakeImplCopyWith<$Res> implements $TakeCopyWith<$Res> {
  factory _$$TakeImplCopyWith(
    _$TakeImpl value,
    $Res Function(_$TakeImpl) then,
  ) = __$$TakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String userId,
    String content,
    ContentType contenttype,
    String responder,
    String punishment,
    int duration,
    TakeStatus status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    int likes,
    int shares,
    int agrees,
    int disagrees,
  });
}

/// @nodoc
class __$$TakeImplCopyWithImpl<$Res>
    extends _$TakeCopyWithImpl<$Res, _$TakeImpl>
    implements _$$TakeImplCopyWith<$Res> {
  __$$TakeImplCopyWithImpl(_$TakeImpl _value, $Res Function(_$TakeImpl) _then)
    : super(_value, _then);

  /// Create a copy of Take
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? content = null,
    Object? contenttype = null,
    Object? responder = null,
    Object? punishment = null,
    Object? duration = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? likes = null,
    Object? shares = null,
    Object? agrees = null,
    Object? disagrees = null,
  }) {
    return _then(
      _$TakeImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        content:
            null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                    as String,
        contenttype:
            null == contenttype
                ? _value.contenttype
                : contenttype // ignore: cast_nullable_to_non_nullable
                    as ContentType,
        responder:
            null == responder
                ? _value.responder
                : responder // ignore: cast_nullable_to_non_nullable
                    as String,
        punishment:
            null == punishment
                ? _value.punishment
                : punishment // ignore: cast_nullable_to_non_nullable
                    as String,
        duration:
            null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                    as int,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TakeStatus,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        expiresAt:
            freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        likes:
            null == likes
                ? _value.likes
                : likes // ignore: cast_nullable_to_non_nullable
                    as int,
        shares:
            null == shares
                ? _value.shares
                : shares // ignore: cast_nullable_to_non_nullable
                    as int,
        agrees:
            null == agrees
                ? _value.agrees
                : agrees // ignore: cast_nullable_to_non_nullable
                    as int,
        disagrees:
            null == disagrees
                ? _value.disagrees
                : disagrees // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TakeImpl implements _Take {
  const _$TakeImpl({
    required this.id,
    required this.title,
    required this.userId,
    required this.content,
    required this.contenttype,
    required this.responder,
    required this.punishment,
    required this.duration,
    required this.status,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'expires_at') this.expiresAt,
    this.likes = 0,
    this.shares = 0,
    this.agrees = 0,
    this.disagrees = 0,
  });

  factory _$TakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TakeImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String userId;
  @override
  final String content;
  @override
  final ContentType contenttype;
  @override
  final String responder;
  @override
  final String punishment;
  @override
  final int duration;
  @override
  final TakeStatus status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final int shares;
  @override
  @JsonKey()
  final int agrees;
  @override
  @JsonKey()
  final int disagrees;

  @override
  String toString() {
    return 'Take(id: $id, title: $title, userId: $userId, content: $content, contenttype: $contenttype, responder: $responder, punishment: $punishment, duration: $duration, status: $status, createdAt: $createdAt, expiresAt: $expiresAt, likes: $likes, shares: $shares, agrees: $agrees, disagrees: $disagrees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TakeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contenttype, contenttype) ||
                other.contenttype == contenttype) &&
            (identical(other.responder, responder) ||
                other.responder == responder) &&
            (identical(other.punishment, punishment) ||
                other.punishment == punishment) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.agrees, agrees) || other.agrees == agrees) &&
            (identical(other.disagrees, disagrees) ||
                other.disagrees == disagrees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    userId,
    content,
    contenttype,
    responder,
    punishment,
    duration,
    status,
    createdAt,
    expiresAt,
    likes,
    shares,
    agrees,
    disagrees,
  );

  /// Create a copy of Take
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TakeImplCopyWith<_$TakeImpl> get copyWith =>
      __$$TakeImplCopyWithImpl<_$TakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TakeImplToJson(this);
  }
}

abstract class _Take implements Take {
  const factory _Take({
    required final String id,
    required final String title,
    required final String userId,
    required final String content,
    required final ContentType contenttype,
    required final String responder,
    required final String punishment,
    required final int duration,
    required final TakeStatus status,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'expires_at') final DateTime? expiresAt,
    final int likes,
    final int shares,
    final int agrees,
    final int disagrees,
  }) = _$TakeImpl;

  factory _Take.fromJson(Map<String, dynamic> json) = _$TakeImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get userId;
  @override
  String get content;
  @override
  ContentType get contenttype;
  @override
  String get responder;
  @override
  String get punishment;
  @override
  int get duration;
  @override
  TakeStatus get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  int get likes;
  @override
  int get shares;
  @override
  int get agrees;
  @override
  int get disagrees;

  /// Create a copy of Take
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TakeImplCopyWith<_$TakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
