part of 'leader_board_component_cubit.dart';

class LeaderBoardComponentState extends Equatable {
  final List<User> users;
  final User myAccount;
  final bool isLoading;

  const LeaderBoardComponentState({
    this.users = const <User>[],
    this.myAccount = const User('', 1, 1, ""),
    this.isLoading = false,
  });

  // Implementing the copyWith function
  LeaderBoardComponentState copyWith({
    List<User>? users,
    User? myAccount,
    bool? isLoading,
  }) {
    return LeaderBoardComponentState(
      users: users ?? this.users,
      myAccount: myAccount ?? this.myAccount,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // Implementing the props getter for Equatable
  @override
  List<Object?> get props => [users, myAccount, isLoading];
}
