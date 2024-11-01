import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_clone/Presentation/Splash/Pages/splash.dart';
import 'package:spotify_clone/Presentation/choose_mode/Pages/choose_mode.dart';
import 'package:spotify_clone/Presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_clone/Presentation/intro/Pages/get_started.dart';
import 'Core/Config/Themes/app_themes.dart';
import 'Presentation/authentication/pages/signin.dart';
import 'Presentation/authentication/pages/signup.dart';
import 'Presentation/authentication/pages/signup_or_signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
  } catch (e) {
    // Handle error during storage initialization
    print("HydratedStorage initialization error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: mode,
            initialRoute: '/',
            routes: {
              '/': (context) => const Splash(),
              '/getStarted': (context) => const  GetStartedPage(),
              '/chooseMode': (context) => const ChooseModePage(),
              '/sign': (context) => const SignupOrSignin(),
              '/signupPage': (context) => const SignupPage(),
              '/signinPage': (context) => const SignInPage(),
            },
          );
        },
      ),
    );
  }
}
