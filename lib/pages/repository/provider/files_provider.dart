import 'package:flutter/foundation.dart';

class FilesProvider with ChangeNotifier{
  void changeFilePath() async {
    notifyListeners();
  }
}