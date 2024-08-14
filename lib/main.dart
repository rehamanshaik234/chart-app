import 'package:blyk_leave_management/controller/providers/home/home_provider.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/app_themes.dart';
import 'package:blyk_leave_management/utils/app_urls.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/state/apply_leave_state.dart';
import 'package:blyk_leave_management/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: AppUrls.supabaseUrl, anonKey: AppUrls.anonKey,debug: true,);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create:(context)=>ApplyLeaveState()),
    ChangeNotifierProvider(create:(context)=>HomeProvider()),
  ],child: const MyApp(),));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(size.width,size.height),
      builder: (context,child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppThemes().lightTheme,
          home: const SplashScreen(),
        );
      }
    );
  }
}

