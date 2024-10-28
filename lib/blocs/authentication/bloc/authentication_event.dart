part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AuthenticationLoginEvent extends AuthenticationEvent {}

final class AuthenticationLogoutEvent extends AuthenticationEvent {}
