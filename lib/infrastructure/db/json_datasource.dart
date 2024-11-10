import 'dart:convert';
import 'dart:io';

import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/domain/daily_food/daily_food.dart';
import 'package:simple_food_tracker/domain/db/db_repository.dart';
import 'package:path/path.dart' as p;
import 'package:simple_food_tracker/domain/food/food.dart';
import 'package:simple_food_tracker/domain/meal/meal.dart';
import 'package:uuid/uuid.dart';

class JsonDatasource<T extends Entity> extends Datasource<T> {
  final String path;
  final T Function(T data) fromEntity;
  final T Function(Map<String, dynamic> json) fromJson;

  JsonDatasource({
    required this.path,
    required this.fromEntity,
    required this.fromJson,
  });

  Future<File> _localFile(Uuid id) async {
    var localDir = Directory(path);
    if (localDir.existsSync() == false) {
      localDir.createSync(recursive: true);
    }

    var file = File(p.join(path, id.v1()));
    await file.create(recursive: true);
    return file;
  }

  @override
  Future<void> write(T data) async {
    final file = await _localFile(data.id);

    file.writeAsStringSync(jsonEncode(fromEntity(data)));
  }

  @override
  Future<T> read(Uuid id) async {
    try {
      final file = await _localFile(id);
      return fromJson(jsonDecode(file.readAsStringSync()));
    } catch (e) {
//TODO: Add Error handling
      throw Exception([e]);
    }
  }

  @override
  Future<List<T>> readAll() async {
    List<T> list = [];
    var localDir = Directory(path);

    for (var dir in localDir.listSync()) {
      if (dir is File == true) {
        var file = File(dir.path);
        list.add(jsonDecode(file.readAsStringSync()));
      }
    }
    return list;
  }

  @override
  Future<void> delete(String data, String fileName) async {
    // final file = await _localFile(fileName);

    // final contents = await file.readAsString();

    // var newData;
    // await file.writeAsString(newData, mode: FileMode.write);
  }
}

class FoodJsonDatasource extends JsonDatasource<Food>
    implements FoodDatasource {
  FoodJsonDatasource()
      : super(
          path: p.join(Directory.current.path, 'simple_food_tracker', 'food'),
          fromJson: (json) => Food.fromJson(json),
          fromEntity: (data) => Food.fromEntity(data),
        );
}

class MealJsonDatasoruce extends JsonDatasource<Meal>
    implements MealDatasrouce {
  MealJsonDatasoruce()
      : super(
          path: p.join(Directory.current.path, 'simple_food_tracker', 'meal'),
          fromJson: (json) => Meal.fromJson(json),
          fromEntity: (data) => Meal.fromEntity(data),
        );
}

class DailyFoodJsonDatasource extends JsonDatasource<DailyFood>
    implements DailyFoodDatasoruce {
  DailyFoodJsonDatasource()
      : super(
          path: p.join(
              Directory.current.path, 'simple_food_tracker', 'daily_food'),
          fromJson: (json) => DailyFood.fromJson(json),
          fromEntity: (data) => DailyFood.fromEntity(data),
        );
}
