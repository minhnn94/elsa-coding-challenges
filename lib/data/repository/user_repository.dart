import 'package:elsa_coding_challenge/data/generate_data/generate_data.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';

class UserRepository {
  Future<List<User>> getUsers(int count) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return UsersHelper().getUsers(count);
  }
}
