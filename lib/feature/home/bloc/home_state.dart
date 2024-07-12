part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.tokenStatus = ApiStatus.initial,
    this.token = '',
});

  final ApiStatus tokenStatus;
  final String token;

  HomeState copyWith({
    ApiStatus? tokenStatus,
    String? token,
  }) {
    return HomeState(
      tokenStatus: tokenStatus ?? this.tokenStatus,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [
    tokenStatus,
    token,
  ];
}

enum ApiStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ApiStatus.initial;
  bool get isLoading => this == ApiStatus.loading;
  bool get isSuccess => this == ApiStatus.success;
  bool get isFailure => this == ApiStatus.failure;
}
