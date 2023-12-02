import '../lib/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('isValidEMail', () {
    bool res;
    res = isValidEmail('juanfelipero@gmail.com');
    expect(res, true);
  });
}
