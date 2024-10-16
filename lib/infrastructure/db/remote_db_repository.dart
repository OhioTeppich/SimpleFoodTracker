import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:simple_food_tracker/domain/db/db_repository.dart';
import 'package:uuid/uuid.dart';

class RemoteDbRepository extends DbRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String file) async {
    final path = await _localPath;
    return File('$path/$file');
  }

  @override
  Future<void> create(String data, String fileName) async {
    final file = await _localFile(fileName);
    file.writeAsString(data, mode: FileMode.append);
  }

  @override
  Future<void> delete(Uuid id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<String> read(String fileName) async {
    try {
      final file = await _localFile(fileName);
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
//TODO: Add Error handling
      return '';
    }
  }
}
