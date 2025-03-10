import 'package:flutter/material.dart';
import 'package:foodie/bootstrap/bootstrap.dart';

import 'common/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializeLocalStorage();
  runApp(const Bootstrap());
}



