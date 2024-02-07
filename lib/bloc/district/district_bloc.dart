import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../values/strings.dart';

part 'district_event.dart';
part 'district_state.dart';

class DistrictBloc extends Bloc<MainDistrictEvent, DistrictState> {
  DistrictBloc() : super(DistrictInitialState()) {
    on<DistrictEvent>(
      (event, emit) {
        try {
          emit(DistrictLoadingState());
          FirebaseFirestore.instance.collection("District").doc().set({
            "District": event.district["district"],
            "id": event.districtId.v4(),
          });
          emit(DistrictSuccessState());
        } catch (e, s) {
          Logger().e('$e\n$s');
          if (e is FirebaseException) {
            emit(DistrictFailureState(message: e.message.toString()));
          } else {
            emit(DistrictFailureState(message: e.toString()));
          }
        }
      },
    );
    on<DistrictGetEvent>((event, emit) async {
      try {
        emit(DistrictLoadingState());
        var data =
            await FirebaseFirestore.instance.collection("District").get();
        List<dynamic> temp = [];
        data.docs.forEach((doc) {
          temp.add(doc['district']);
        });
        emit(DistrictGetSuccessState(districtList: temp));
      } catch (e, s) {
        Logger().e('$e\n$s');
        if (e is FirebaseException) {
          emit(DistrictFailureState(message: e.message.toString()));
        } else {
          emit(DistrictFailureState(message: e.toString()));
        }
      }
    });
  }
}
