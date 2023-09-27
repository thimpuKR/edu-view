import 'package:permission_handler/permission_handler.dart';

class Permissions {
  // 마이크 권한을 요청하는 메서드
  Future<bool> requestMicrophonePermission() async {
    // 마이크 권한 상태를 확인합니다.
    PermissionStatus status = await Permission.microphone.status;

    // 권한이 이미 부여되었는지 확인합니다.
    if (status.isGranted) {
      return true;
    } else {
      // 권한이 부여되지 않았다면, 권한을 요청합니다.
      status = await Permission.microphone.request();
      return status.isGranted;
    }
  }
}
