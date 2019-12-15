// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventList _$EventListFromJson(Map<String, dynamic> json) {
  return EventList(
    (json['eventList'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventListToJson(EventList instance) => <String, dynamic>{
      'eventList': instance.eventList,
    };
