import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationLoginEvent>((event, emit) {
      emit(AuthenticationLoggedIn());
    });
    on<AuthenticationLogoutEvent>((event, emit) {
      emit(AuthenticationLoggedOut());
    });
  }
}
