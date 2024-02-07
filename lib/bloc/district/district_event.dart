part of 'district_bloc.dart';

@immutable
abstract class MainDistrictEvent {}

class DistrictEvent extends MainDistrictEvent {
  final Map<String, dynamic> district;
  final districtId = const Uuid();
  DistrictEvent({required this.district});
}

class DistrictDeleteEvent extends MainDistrictEvent {
  final String id;

  DistrictDeleteEvent({required this.id});
}

class DistrictEditEvent extends MainDistrictEvent {
  final String id, name;

  DistrictEditEvent({required this.name, required this.id});
}
