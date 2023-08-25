import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  /// to check in shared prefrences if user is using the app for first time
  Future<String?> getLoginCredentials() async {
    const storage = FlutterSecureStorage();
    String? loginDetails = await storage.read(key: "LoginCredentials");
    return (loginDetails?.length ?? 0) == 0 ? null : loginDetails;
  }

  setLoginCredentials(String value) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "LoginCredentials", value: value);
  }

  clearLoginCredentials() async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "LoginCredentials", value: "");
  }
}
