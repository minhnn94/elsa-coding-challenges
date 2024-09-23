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
    emit(state.copyWith(myAccount: UsersHelper().myAccount));
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
    if (user.id == state.myAccount.id) {
      emit(state.copyWith(myAccount: user));
    }
    _handleAddNewUserToTopList(user);
  }

  void _handleAddNewUserToTopList(User user) {
    if (user.id == UsersHelper().myAccount.id) {
      UsersHelper().myAccount = user;
    }
    state.copyWith(myAccount: UsersHelper().myAccount);
    if (state.users.indexWhere((element) => element.id == user.id) >= 0) {
      final users = _getUsersWhenContainUserUpdate(user);
      final usersSort = _getUsersAfterSort(users);
      _updateUsers(usersSort);
    } else {
      final users = [...state.users, user];
      final usersSort = _getUsersAfterSort(users);
      _updateUsers(usersSort);
    }
  }

  void _updateUsers(List<User> users) {
    emit(state.copyWith(users: []));
    emit(state.copyWith(users: users));
  }

  List<User> _getUsersWhenContainUserUpdate(User user) {
    final index = state.users.indexWhere((element) => element.id == user.id);
    final users = [...state.users];
    users[index] = user;
    return users;
  }

  List<User> _getUsersAfterSort(List<User> users) {
    users.sort((a, b) => a.score.compareTo(b.score));
    final result = users.reversed.toList();
    return result;
  }
}
