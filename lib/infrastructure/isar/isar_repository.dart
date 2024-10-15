import 'package:isar/isar.dart';

abstract class IsarRepository<T> {
  Future<void> create(T data);
  Future<T> read(Id id);
  Future<void> delete(Id id);
}
