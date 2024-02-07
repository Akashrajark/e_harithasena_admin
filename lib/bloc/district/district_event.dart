part of 'district_bloc.dart';

@immutable
abstract class MainDistrictEvent {}

class DistrictEvent extends MainDistrictEvent {
  final Map<String, dynamic> district;
  final districtId = const Uuid();
  DistrictEvent({required this.district});
}

class DistrictGetEvent extends MainDistrictEvent {}
