import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()){
    on<GetAccessTokenEvent>(_generateToken);
  }

  Future<void> _generateToken(
    GetAccessTokenEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(tokenStatus: ApiStatus.loading));
    try {
      final token = await getAccessToken(json: event.json);
      emit(state.copyWith(tokenStatus: ApiStatus.success, token: token));
    } catch (e) {
      emit(state.copyWith(tokenStatus: ApiStatus.failure));
    }
  }

  Future<String> getAccessToken({required json}) async {

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(json),
      scopes,
    );

    // Obtain the access token
    auth.AccessCredentials credentials =
    await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(json),
      scopes,
      client,
    );

    // Close the HTTP client
    client.close();

    // Return the access token
    return credentials.accessToken.data;
  }
}
