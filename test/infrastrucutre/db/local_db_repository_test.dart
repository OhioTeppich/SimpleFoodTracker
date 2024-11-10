import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/infrastructure/db/json_datasource.dart';
import 'package:uuid/uuid.dart';

class _TestEntity extends Equatable with Entity {
  const _TestEntity({
    required this.id,
    required this.value,
    required this.list,
    required this.date,
  });

  @override
  final Uuid id;
  final int value;
  final List<String> list;
  final DateTime date;

  factory _TestEntity.fromJson(Map<String, dynamic> json) {
    return _TestEntity(
      id: json['id'],
      value: json['value'],
      list: [...json['list']],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'list': list,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        value,
        list,
        date,
      ];
}

class _TestEntityLocalDatasource extends JsonDatasource<_TestEntity> {
  _TestEntityLocalDatasource()
      : super(
          path: '/Users/christianmaciosek/simple_food_tracker/trash',
          fromJson: (json) => _TestEntity.fromJson(json),
          fromEntity: (data) => data,
        );
}

void main() {
  late _TestEntity data;
  late _TestEntityLocalDatasource datasource;
  late DateTime date;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();

    datasource = _TestEntityLocalDatasource();
    date = DateTime.now();
    data = _TestEntity(
      id: const Uuid(),
      value: 1,
      list: const ['list1', 'list2'],
      date: date,
    );
  });

  tearDownAll(() async {
    // var directory = Directory(path);
    // directory.deleteSync(recursive: true);
  });

  group('LocalDbRepository', () {
    group('write', () {
      test('should write a file', () async {
        await datasource.write(data);

        var file = File(
          p.join(
            '/Users/christianmaciosek/simple_food_tracker/trash',
            data.id.v1(),
          ),
        );

        expect(file.existsSync(), isTrue);
      });
    });
    // group('read', () {
    //   test('should read data from file', () async {
    //     var actual = await localDbRepository.read('localDB.json');

    //     expect(actual, [data]);
    //   });
    // });
  });
}
