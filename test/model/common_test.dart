import 'package:test/test.dart';
import 'package:flutter_sample_app/model/common.dart';

void main() {
  group('common_model', () {
    int setupAllCount = 0;
    int setupCount = 0;
    int tearDownCount = 0;
    int tearDownAllCount = 0;

    setUp(() {
      setupCount++;
    });

    tearDown(() => {
      tearDownCount++
    });

    setUpAll(() {
      setupAllCount++;
    });

    tearDownAll(() {
      tearDownAllCount++;
    });

    test('Success Test', () {
      var commonModel = CommonModel('test1');
      print('success test start');
      print('setup count : $setupCount');
      print('setupAll count : $setupAllCount');
      print('tearDown count : $tearDownCount');
      print('tearDownAll count : $tearDownAllCount');
      print('success test end');
      expect(commonModel.userId, equals('test1'));
    });

    test('Failure Test', () {
      var commonModel = CommonModel('test2');
      print('failure test start');
      print('setup count : $setupCount');
      print('setupAll count : $setupAllCount');
      print('tearDown count : $tearDownCount');
      print('tearDownAll count : $tearDownAllCount');
      print('failure test end');
      expect(commonModel.readonlyUserId, equals('test1'));
    });
  });
}