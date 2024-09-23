import 'package:dio/dio.dart';
import 'package:elsa_coding_challenge/data/models/questions_model.dart';
import 'package:elsa_coding_challenge/shared_widgets/debug_log.dart';

class QuestionRepository {
  Future<List<QuestionsModel>> getQuestion() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://the-trivia-api.com/v2/questions');
      ;
      if (response.statusCode == 200) {
        return QuestionsModel.fromListJson(response.data);
      } else {
        return [];
      }
    } catch (e) {
      debugLog(e.toString());

      return [];
    }
  }
}
