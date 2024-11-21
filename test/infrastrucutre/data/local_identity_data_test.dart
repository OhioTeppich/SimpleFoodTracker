import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_food_tracker/domain/core/entity.dart';
import 'package:simple_food_tracker/domain/datasource/datasource.dart';
import 'package:simple_food_tracker/domain/repositories/data_repository.dart';
import 'package:simple_food_tracker/infrastructure/data/local_identity_data.dart';

class TestEntity with Entity {
  const TestEntity(this.id, this.value);
  @override
  final String id;
  final String value;
}

class MockTestEntity extends Mock implements TestEntity {}

class MockDatasource extends Mock implements Datasource<TestEntity> {}

class TestEntityData extends LocalEntityData<TestEntity> {
  TestEntityData(MockDatasource datasource) : super(datasource: datasource);
}

Matcher throwsEntityNotFoundException =
    throwsA(const TypeMatcher<EntityNotFoundException>());
Matcher throwsEntityAlreadyExistsException =
    throwsA(const TypeMatcher<EntityAlreadyExistsException>());

void main() {
  late TestEntityData testEntityData;
  late TestEntity testEntity;
  late MockDatasource mockDatasource;

  void setUpMock() {
    when(() => mockDatasource.read(any()))
        .thenAnswer((_) async => Future.value());
    when(() => mockDatasource.write(any()))
        .thenAnswer((_) async => Future.value());
    when(() => mockDatasource.readAll()).thenAnswer((invocation) async => []);
  }

  setUp(() {
    mockDatasource = MockDatasource();
    testEntityData = TestEntityData(mockDatasource);
    testEntity = const TestEntity('id', 'value');

    setUpMock();
  });

  setUpAll(() {
    registerFallbackValue(MockTestEntity());
  });

  group('LocalEntityData', () {
    group('add', () {
      test('should call datasource.read and write', () async {
        await testEntityData.add(testEntity);

        verify(() => mockDatasource.read(testEntity.id)).called(1);
        verify(() => mockDatasource.write(testEntity)).called(1);
      });
      test(
          'should throw EntityAlreadyExistsException when datasource read testEntity',
          () async {
        when(() => mockDatasource.read(any()))
            .thenAnswer((_) async => testEntity);

        expect(() async => await testEntityData.add(testEntity),
            throwsEntityAlreadyExistsException);
      });
    });
    group('get', () {
      test('should return testEntity and call datasource.read', () async {
        when(() => mockDatasource.read(any()))
            .thenAnswer((_) async => testEntity);

        var actual = await testEntityData.get(testEntity.id);

        expect(actual, testEntity);
        verify(() => mockDatasource.read(testEntity.id));
      });
      test('should throw EntityNotFoundException', () async {
        expect(() async => await testEntityData.get(testEntity.id),
            throwsEntityNotFoundException);
      });
    });
    group('gets', () {
      test('should return a empty list and call datasource.readAll', () async {
        var actual = await testEntityData.gets();

        expect(actual, []);
        verify(() => mockDatasource.readAll());
      });
      test('should return list with testEntity', () async {
        when(() => mockDatasource.readAll())
            .thenAnswer((invocation) async => [testEntity]);

        var actual = await testEntityData.gets();

        expect(actual, [testEntity]);
        verify(() => mockDatasource.readAll());
      });
    });
  });
}
