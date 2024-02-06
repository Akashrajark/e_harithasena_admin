import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../values/strings.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password);

        if (user.user!.uid == FirebaseAuth.instance.currentUser!.uid) {
          emit(LoginSuccessState());
        } else {
          emit(LoginFailureState(message: "Unauthorized!"));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        if (e is FirebaseAuthException) {
          emit(LoginFailureState(message: e.message.toString()));
        } else {
          emit(LoginFailureState(message: e.toString()));
        }
      }
    });
  }
}
