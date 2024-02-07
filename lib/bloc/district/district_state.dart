part of 'district_bloc.dart';

@immutable
abstract class DistrictState {}

class DistrictInitialState extends DistrictState {}

class DistrictLoadingState extends DistrictState {}

class DistrictSuccessState extends DistrictState {}

class DistricGettInitialState extends DistrictState {}

class DistrictGetSuccessState extends DistrictState {
  final List<dynamic> districtList;

  DistrictGetSuccessState({required this.districtList});
}

class DistrictFailureState extends DistrictState {
  final String message;

  DistrictFailureState({this.message = apiErrorMessage});
}
