import 'package:bin_vigin_admin/bindings/initial_bindings.dart';
import 'package:bin_vigin_admin/features/auth/screens/loading_screen.dart';
import 'package:bin_vigin_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BinVigil Admin',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: AppBindings(),
        builder: EasyLoading.init(
          builder: (context, child) {
            EasyLoading.instance
              ..userInteractions = false
              ..maskType = EasyLoadingMaskType.black;
            return child!;
          },
        ),
        home: const LoadingScreen(),
      ),
    );
  }
}
