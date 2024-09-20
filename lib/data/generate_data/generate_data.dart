import 'package:elsa_coding_challenge/common/extensions/string_extensions.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:english_words/english_words.dart';

List<String> generateRandomFullNames(int count) {
  const random = WordPair.random;
  List<String> names = [];

  for (int i = 0; i < count; i++) {
    // Generate a random first name and last name
    String firstName = random().first.toCapitalized();
    String lastName = random().second.toCapitalized();
    String fullName = '$firstName $lastName';

    // Add the full name to the list
    names.add(fullName);
  }

  return names;
}

class UsersHelper {
  // Private static instance variable
  static final UsersHelper _instance = UsersHelper._internal();

  // Private constructor
  UsersHelper._internal();

  // Factory constructor that returns the same instance
  factory UsersHelper() {
    return _instance;
  }

  // Add your class properties and methods here
  List<User> getUsers(int count) {
    const random = WordPair.random;
    List<User> users = [];

    for (int i = 0; i < count; i++) {
      // Generate a random first name and last name
      String firstName = random().first.toCapitalized();
      String lastName = random().second.toCapitalized();
      String fullName = '$firstName $lastName';

      // Add the full name to the list
      users.add(User(fullName, 0, i));
    }

    return users;
  }
}
