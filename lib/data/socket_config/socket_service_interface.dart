abstract class ISocketService {
  Future<void> connect(String address, int port);
  Future<void> send(String message);
  Future<String> receive();
  void disconnect();
}
