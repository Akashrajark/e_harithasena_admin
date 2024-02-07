import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          FirebaseFirestore.instance
              .collection("districts")
              .doc(event.district["district"])
              .set({
            "name": event.district["district"],
            "id": event.districtId.v1(),
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
    on<DistrictDeleteEvent>((event, emit) {
      try {
        emit(DistrictLoadingState());
        // FirebaseFirestore.instance
        //     .collection("districts").doc().delete();
        var collection = FirebaseFirestore.instance.collection('districts');
        collection.doc(event.id).delete();
        emit(DistrictSuccessState());
      } catch (e, s) {
        Logger().e('$e\n$s');
        if (e is FirebaseException) {
          emit(DistrictFailureState(message: e.message.toString()));
        } else {
          emit(DistrictFailureState(message: e.toString()));
        }
      }
    });
    on<DistrictEditEvent>((event, emit) {
      try {
        emit(DistrictLoadingState());
        // FirebaseFirestore.instance
        //     .collection("districts").doc().delete();
        var collection = FirebaseFirestore.instance.collection('districts');
        collection.doc(event.id).update({"name": event.id});
        emit(DistrictSuccessState());
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
