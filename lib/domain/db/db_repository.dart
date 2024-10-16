abstract class DbRepository {
  Future<void> create(String data, String fileName);
  Future<String> read(String fileName);
  Future<void> delete(String data, String fileName);
}
