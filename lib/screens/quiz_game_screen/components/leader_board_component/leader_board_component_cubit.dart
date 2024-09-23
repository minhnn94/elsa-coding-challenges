import 'package:elsa_coding_challenge/data/generate_data/generate_data.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:elsa_coding_challenge/data/repository/user_repository.dart';
import 'package:elsa_coding_challenge/data/socket_config/mock_socket_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'leader_board_component_state.dart';

class LeaderBoardComponentCubit extends Cubit<LeaderBoardComponentState>
    implements ISocketSubscriber {
  LeaderBoardComponentCubit() : super(const LeaderBoardComponentState()) {
    initialData();
  }
  final _repository = UserRepository();
  void initialData() {
    MockSocketService().connect('https://mock.socket.com', 4);
    MockSocketService().addListener(this);
    loadingData();
  }

  Future<void> loadingData() async {
    emit(state.copyWith(isLoading: true));
    final users = await _repository.getUsers(3);
    emit(state.copyWith(users: users, isLoading: false));
  }

  @override
  Future<void> close() {
    MockSocketService().disconnect();
    UsersHelper().resetData();
    return super.close();
  }

  @override
  void onMessage(User user) {
    if (user == state.myAccount) {
      emit(state.copyWith(myAccount: user));
    }
    _handleAddNewUserToTopList(user);
  }

  void _handleAddNewUserToTopList(User user) {
    if (state.users.contains(user)) {
      final index = state.users.indexWhere((element) => element == user);
      final users = [...state.users];
      users[index] = user;

      users.sort((a, b) => a.score.compareTo(b.score));
      emit(state.copyWith(users: []));
      emit(state.copyWith(users: users.reversed.toList()));
    } else {
      final users = [...state.users, user];
      users.sort((a, b) => a.score.compareTo(b.score));
      emit(state.copyWith(users: []));
      emit(state.copyWith(users: users.reversed.toList()));
    }
  }
}
