import 'package:blyk_leave_management/controller/providers/home/home_provider.dart';
import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/models/RouteParams.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/utils/routes/RouteNames.dart';
import 'package:blyk_leave_management/utils/routes/Routes.dart';
import 'package:blyk_leave_management/views/authentication/login_screen.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/apply_leave.dart';
import 'package:blyk_leave_management/views/main_views/home/home_screen.dart';
import 'package:blyk_leave_management/views/widgets/custom_app_bar.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_button.dart';
import 'package:blyk_leave_management/views/widgets/loading.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  GlobalKey<NavigatorState> navKey=GlobalKey<NavigatorState>();
  // int navBarIndex=0;
  // String currentRoute=RoutesName.provider.loaderScreen;
  PageController pageController=PageController();
  String appBarTitle='Home';

  final ScrollController scrollController=ScrollController();
  int currentPage=0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
     getData();
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<HomeProvider>(
      builder: (context,provider,child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned(
                  top: 0.0,
                  child:
                CustomAppBar(title: appBarTitle, homeScreen: currentPage==0 && !provider.loader,),
                ),
                SingleChildScrollView(
                  controller: scrollController,
                  physics:currentPage==0 && !provider.loader?null: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          AnimatedContainer(
                            height:currentPage==0 && !provider.loader? 1.sh*0.35:1.sh*0.07,
                            duration: Constants.fastDuration,
                          ),
                          Positioned(
                              top: 16.h,
                              right: 16.w,
                              child: InkWell(
                                  onTap: ()async {
                                    await LoginSession().clear();
                                    Navigator.pushAndRemoveUntil(context,CustomRoute.createRoute(page: LoginScreen(), transitionType: TransitionType.scale,applyAnimation: false),(route)=>false);
                                  },
                                  child: Icon(Icons.settings,color: Colors.transparent,size: 20.sp,)))
                        ],
                      ),
                      SizedBox(
                        height:currentPage==0 && !provider.loader? provider.columnHeight:1.sh,
                        child:provider.loader? const Center(
                          child: Loading(),
                        ): PageView(
                          onPageChanged: (page){
                            setState(() {
                              if(page==0){
                                appBarTitle='Home';
                              }else{
                                appBarTitle='Apply Leave';
                              }
                              scrollController.position.moveTo(0.0);
                              currentPage=page;
                            });
                          },
                          controller: pageController,
                          children: const [
                            HomeScreen(),
                            ApplyLeave()
                          ],

                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              onTap: (tab){
                currentPage=tab;
                setState(() {});
                changeRoute(tab);
                },
              currentIndex:currentPage,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryColor,
              selectedLabelStyle: TextStyle(color: AppColors.primaryColor,fontSize: 16.sp,fontFamily: 'Poppins',fontWeight: FontWeight.w500),
              unselectedLabelStyle:TextStyle(color: Colors.grey,fontSize: 16.sp,fontFamily: 'Poppins') ,
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.grey,size: 24.sp,),label: 'Home',activeIcon:Icon(Icons.home,color: AppColors.primaryColor,size: 20.sp,) ),
              BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.grey,size: 24.sp,),label: 'Apply Leave',activeIcon:Icon(Icons.add,color: AppColors.primaryColor,size: 20.sp,) )
            ],),
          ),
        );
      }
    );
  }

  // void onChangeRoute(String? routeName){
  //   if(routeName!=null){
  //     currentRoute=routeName;
  //     setState(() {
  //
  //     });
  //   }
  // }

  void changeRoute(int tab) {
    pageController.animateToPage(
        tab, duration: Constants.fastDuration, curve: Curves.easeInToLinear);
  }

  void getData()async{
    await context.read<HomeProvider>().getData();
  }

}
