import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:login_page/main_page.dart';
import 'package:login_page/widgets/offline.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  bool _isOffline = false; // Track offline status

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      // If disconnected
      if (!_isOffline) {
        // If not already on the Offline screen
        _isOffline = true;
        Get.off(() => Offline());
      }
    } else {
      // If connected
      if (_isOffline) {
        // If previously on the Offline screen
        _isOffline = false;
        Get.off(() => MainPage());
      }
    }
  }
}
