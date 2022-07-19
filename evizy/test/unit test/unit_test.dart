import 'package:evizy/model/api/services_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Services Api Test', () {
    ServiceApi serviceApi = ServiceApi();
    test('Post Login', () async {
      var login = await serviceApi.postLogin('2234567890123456', 'mypassword');
      expect(login.data!.accessToken!.isNotEmpty, true);
    });

    test('Post Register', () async {
      var register = await serviceApi.postRegister(
          'Aku Ganteng', '1234567890123456', '084631795486', 'Super1234');
      expect(register.message!.isNotEmpty, true);
    });
  });
}
