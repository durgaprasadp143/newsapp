import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  // Singleton instance
  static final NetworkManager _instance = NetworkManager._internal();

  // Factory constructor to return the same instance every time
  factory NetworkManager() {
    return _instance;
  }

  // Private constructor
  NetworkManager._internal();

  // Method to check network connectivity
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}