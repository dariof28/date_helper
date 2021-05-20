import 'package:date_helper/src/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Retrieve day start', () async {
    DateTime date = new DateTime(2021, 05, 21, 15, 50);
    expect(date.dayStart, new DateTime(2021, 05, 21, 0, 0));
  });

  test('Retrieve day end', () async {
    DateTime date = new DateTime(2021, 05, 21, 15, 50);
    expect(date.dayEnd, new DateTime(2021, 05, 21, 23, 59));
  });

  test('Determine if is AM', () async {
    for (int h = 0; h < 12; h++) {
      for (int m = 0; m < 60; m++) {
        DateTime date = new DateTime(2021, 05, 21, h, m);
        expect(date.isAM, true);
      }
    }

    for (int h = 12; h < 24; h++) {
      for (int m = 0; m < 60; m++) {
        DateTime date = new DateTime(2021, 05, 21, h, m);
        expect(date.isAM, false);
      }
    }
  });

  test('Determine if is PM', () async {
    for (int h = 0; h < 12; h++) {
      for (int m = 0; m < 60; m++) {
        DateTime date = new DateTime(2021, 05, 21, h, m);
        expect(date.isPM, false);
      }
    }

    for (int h = 12; h < 24; h++) {
      for (int m = 0; m < 60; m++) {
        DateTime date = new DateTime(2021, 05, 21, h, m);
        expect(date.isPM, true);
      }
    }
  });

  test('Retrieve tomorrow', () async {
    DateTime date = new DateTime(2021, 05, 21);
    expect(date.tomorrow, new DateTime(2021, 05, 22));
  });

  test('Retrieve yesterday', () async {
    DateTime date = new DateTime(2021, 05, 21);
    expect(date.yesterday, new DateTime(2021, 05, 20));
  });

  test('Retrieve following weekday', () async {
    // 2021-05-21 is Friday
    DateTime date = new DateTime(2021, 05, 21);
    expect(date.following(DateTime.monday), new DateTime(2021, 05, 24));
    expect(date.following(DateTime.tuesday), new DateTime(2021, 05, 25));
    expect(date.following(DateTime.wednesday), new DateTime(2021, 05, 26));
    expect(date.following(DateTime.thursday), new DateTime(2021, 05, 27));
    expect(date.following(DateTime.friday), new DateTime(2021, 05, 28));
    expect(date.following(DateTime.saturday), new DateTime(2021, 05, 22));
    expect(date.following(DateTime.sunday), new DateTime(2021, 05, 23));
  });

  test('Retrieve following weekday must have valid weekday', () async {
    DateTime date = new DateTime(2021, 05, 20);
    expect(() => date.following(0), throwsAssertionError);
    expect(() => date.following(8), throwsAssertionError);
  });

  test('Retrieve previous weekday', () async {
    // 2021-05-21 is Friday
    DateTime date = new DateTime(2021, 05, 21);
    expect(date.previous(DateTime.monday), new DateTime(2021, 05, 17));
    expect(date.previous(DateTime.tuesday), new DateTime(2021, 05, 18));
    expect(date.previous(DateTime.wednesday), new DateTime(2021, 05, 19));
    expect(date.previous(DateTime.thursday), new DateTime(2021, 05, 20));
    expect(date.previous(DateTime.friday), new DateTime(2021, 05, 14));
    expect(date.previous(DateTime.saturday), new DateTime(2021, 05, 15));
    expect(date.previous(DateTime.sunday), new DateTime(2021, 05, 16));
  });

  test('Retrieve previous weekday must have valid weekday', () async {
    DateTime date = new DateTime(2021, 05, 20);
    expect(() => date.previous(0), throwsAssertionError);
    expect(() => date.previous(8), throwsAssertionError);
  });
}
