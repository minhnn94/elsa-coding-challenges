import 'dart:math';

import 'package:elsa_coding_challenge/common/extensions/string_extensions.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:english_words/english_words.dart';
import 'package:uuid/uuid.dart';

class UsersHelper {
  int maxValue = 0;

  static final UsersHelper _instance = UsersHelper._internal();

  UsersHelper._internal();

  factory UsersHelper() {
    return _instance;
  }
  User myAccount = User('Minh Palmy', 0, 100, '_myId');

  List<User> getUsers(int count) {
    List<User> users = [];

    for (int i = 0; i < count; i++) {
      String fullName = getRandomName();
      const uuid = Uuid();
      users.add(User(fullName, 0, i, uuid.v1()));
    }

    return users;
  }

  User getRandomUser() {
    final random = Random().nextInt(2);
    final score = getScore();
    if (random % 2 == 0) {
      return myAccount.copyWith(score: score);
    } else {
      String fullName = getRandomName();
      const uuid = Uuid();

      return User(fullName, score, 0, uuid.v1());
    }
  }

  int getScore() {
    final aHalfOfMax = (maxValue / 2).round();
    final score = aHalfOfMax + Random().nextInt(aHalfOfMax + 100);
    if (score > maxValue) {
      maxValue = score;
    }
    return score;
  }

  String getRandomName() {
    const random = WordPair.random;

    String firstName = random().first.toCapitalized();
    String lastName = random().second.toCapitalized();
    String fullName = '$firstName $lastName';
    return fullName;
  }

  void resetData() {
    maxValue = 0;
  }
}
