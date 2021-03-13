import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  static final HomeController _singleton = HomeController._internal();

  factory HomeController() {
    return _singleton;
  }

  final isMovies = RxNotifier<bool>(true);

  setIsMovie(){
    isMovies.value = true;
  }
  setIsSeries(){
    isMovies.value = false;
  }

  HomeController._internal();
}
