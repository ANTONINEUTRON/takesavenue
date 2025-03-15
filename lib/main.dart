import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takesavenue/utils/routes/routes.dart';
import 'package:takesavenue/features/auth/cubits/auth_cubits.dart';
import 'package:takesavenue/features/home/cubits/home_cubit.dart';
import 'package:takesavenue/firebase_options.dart';
import 'package:takesavenue/utils/app_constants.dart';
import 'package:takesavenue/utils/service/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await LocalStorage.init();

  runApp(const MyApp());
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => AuthCubits()),
      ],
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            secondary: const Color(0XFFE6A479),
            tertiary: const Color(0XFF723412),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
