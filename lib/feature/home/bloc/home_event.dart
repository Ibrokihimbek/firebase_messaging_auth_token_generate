part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetAccessTokenEvent extends HomeEvent {
  final dynamic json;

  const GetAccessTokenEvent({required this.json});

  @override
  List<Object?> get props => [json];
}