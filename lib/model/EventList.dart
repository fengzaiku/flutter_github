import 'package:flutter_github/model/Event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EventList.g.dart';
@JsonSerializable()
class EventList{
  List<Event> eventList;
  EventList(this.eventList);

  factory EventList.fromJson(Map<String, dynamic> json) => _$EventListFromJson(json);

  Map<String, dynamic> toJson() => _$EventListToJson(this);
}