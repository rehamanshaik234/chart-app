import 'dart:io';

import 'package:blyk_leave_management/controller/repo/auth.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_button.dart';
import 'package:blyk_leave_management/views/widgets/popups/custom_pop_ups.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../controller/face_detection/knn_nearest.dart';
import '../../models/User.dart';

class FaceLogin extends StatefulWidget {
  const FaceLogin({super.key});

  @override
  State<FaceLogin> createState() => _FaceLoginState();
}

class _FaceLoginState extends State<FaceLogin> {

  Future<void>? _initializeControllerFuture;
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  AuthRepo authRepo=AuthRepo();
  final knn = KNNClassifier(k: 3);
  bool loader=false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      initCamera();
      addUserProfiles();
    });
  }


  @override
  void dispose() {
    _cameraController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp),topRight: Radius.circular(20.sp))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _initializeControllerFuture!=null? FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Transform.scale(
                    scale: 1,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp),topRight: Radius.circular(20.sp)),
                          child: CameraPreview(_cameraController))),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    child: Text("Look straight towards camera during the process and make sure to have better lighting.",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ):const Center(child: CircularProgressIndicator()),
        bottomNavigationBar:                 Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
          child: CustomButton( onPressed:startDetection, title: "Start",loader: loader,),
        ),
      ),
    );
  }


  void initCamera() async{
    cameras=await availableCameras();
    CameraDescription cameraDescription= cameras[0];
    for (var cameras in cameras) {
      if(cameras.lensDirection==CameraLensDirection.front){
        cameraDescription=cameras;
        break;
      }
    }
    _cameraController=CameraController(cameraDescription, ResolutionPreset.max);
    _initializeControllerFuture = _cameraController.initialize();
    setState(() {

    });
  }

  void addUserProfiles()async{
    List<UserModel> profiles = await authRepo.getAllUsers();
    knn.addTrainingData(profiles);
  }


  void startDetection()async{
    loader=true;
    setState(() {});
    XFile image= await _cameraController.takePicture();
    await _cameraController.pausePreview();
    InputImage img=InputImage.fromFilePath(image.path);
    await knn.detectFaces(img,context,knn,()async{
      await _cameraController.resumePreview();
    });
    File file=File(image.path);
    await file.delete();
    loader=false;
    setState(() {

    });
  }

}
