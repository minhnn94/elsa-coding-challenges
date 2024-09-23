import 'dart:async';

import 'package:elsa_coding_challenge/data/generate_data/generate_data.dart';
import 'package:elsa_coding_challenge/data/models/user_model.dart';
import 'package:elsa_coding_challenge/data/socket_config/socket_service_interface.dart';
import 'package:elsa_coding_challenge/shared_widgets/debug_log.dart';

abstract class ISocketSubscriber {
  void onMessage(User data);
}

class MockSocketService implements ISocketService {
  String? receivedMessage;
  static final MockSocketService _instance = MockSocketService._internal();
  Timer? _timer;
  // Private constructor
  MockSocketService._internal();

  // Factory constructor that returns the same instance
  factory MockSocketService() {
    return _instance;
  }
  List<ISocketSubscriber> _subscibers = [];
  void addListener(ISocketSubscriber subscriber) {
    _subscibers.add(subscriber);
  }

  void onNotify(User data) {
    for (var subscriber in _subscibers) {
      subscriber.onMessage(data);
    }
  }

  void removeListener(ISocketSubscriber socketSubscriber) {
    _subscibers.remove(socketSubscriber);
  }

  @override
  Future<void> connect(String address, int port) async {
    debugLog('Mock Socket connected to $address:$port');
    _fakeToPushData();
  }

  @override
  Future<void> send(dynamic message) async {
    debugLog('Mock Socket sent: $message');
    receivedMessage = 'Mock Socket response for: $message';
    _handleResponseFromSocket(message);
  }

  void _fakeToPushData() {
    _timer == null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final userString = UsersHelper().getRandomUser().toJson();
      send(userString);
    });
  }

  void _handleResponseFromSocket(dynamic message) {
    try {
      final user = User.fromJson(message);
      onNotify(user);
    } catch (e) {
      debugLog(e.toString());
    }
  }

  @override
  Future<String> receive() async {
    return receivedMessage ?? 'No message received';
  }

  @override
  void disconnect() {
    debugLog('Mock Socket disconnected');
    _subscibers.clear();
    _timer?.cancel();
  }
}
