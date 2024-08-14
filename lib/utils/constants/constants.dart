import 'package:provider/provider.dart';

import '../../controller/providers/home/home_provider.dart';
import '../../views/main_views/apply_leave/state/apply_leave_state.dart';

class Constants{
  static String heroTagLogo='hero_tag_logo';
  static String heroBGContainer='hero_bg_container';

  ///sharedPreference
  static String userCredentials='user_credentials';

  static const Duration animationDuration= Duration(milliseconds: 1000);
  static Duration fastDuration=const Duration(milliseconds: 500);

  ///providers
  static List<ChangeNotifierProvider> providers= [
    ChangeNotifierProvider(create:(context)=>ApplyLeaveState()),
    ChangeNotifierProvider(create:(context)=>HomeProvider()),
  ];

//apply leaves
  static String fullDayId="full-day";
  static String halfDayId="half-day";
  static String morningSessionId="mng";
  static String afternoonSessionId="afn";

}