import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyANac0QmSTPX5ZGFhtLsuZ_4QVC2vPIF40",
            authDomain: "travel-app-ey7yzv.firebaseapp.com",
            projectId: "travel-app-ey7yzv",
            storageBucket: "travel-app-ey7yzv.appspot.com",
            messagingSenderId: "892925208416",
            appId: "1:892925208416:web:36cf1293d6f207eccce005"));
  } else {
    await Firebase.initializeApp();
  }
}
