// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventPayload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPayload _$EventPayloadFromJson(Map<String, dynamic> json) {
  return EventPayload(
    json['push_id'] as int,
    json['size'] as int,
    json['distinct_size'] as int,
    json['ref'] as String,
    json['head'] as String,
    json['before'] as String,
    (json['commits'] as List)
        ?.map((e) => e == null
            ? null
            : PushEventCommit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['action'] as String,
    json['ref_type'] as String,
    json['master_branch'] as String,
    json['description'] as String,
    json['pusher_type'] as String,
    json['release'] == null
        ? null
        : Release.fromJson(json['release'] as Map<String, dynamic>),
    json['issue'] == null
        ? null
        : Issue.fromJson(json['issue'] as Map<String, dynamic>),
    json['comment'] == null
        ? null
        : IssueEvent.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventPayloadToJson(EventPayload instance) =>
    <String, dynamic>{
      'push_id': instance.pushId,
      'size': instance.size,
      'distinct_size': instance.distinctSize,
      'ref': instance.ref,
      'head': instance.head,
      'before': instance.before,
      'commits': instance.commits,
      'action': instance.action,
      'ref_type': instance.refType,
      'master_branch': instance.masterBranch,
      'description': instance.description,
      'pusher_type': instance.pusherType,
      'release': instance.release,
      'issue': instance.issue,
      'comment': instance.comment,
    };
