import 'dart:math';

import 'package:blyk_leave_management/controller/repo/auth.dart';
import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/utils/constants/assets_url.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../utils/app_colors.dart';
import '../../views/main_views/navigator.dart';
import '../../views/widgets/popups/custom_pop_ups.dart';
import '../../views/widgets/transitions/navigation_transitons.dart';

class KNNClassifier {
  final List<UserModel> _trainingData = [];
  final int k;
  LoginSession session=LoginSession();

  KNNClassifier({this.k = 3});

  void addTrainingData(List<UserModel> features) {
    _trainingData.addAll(features);
  }

  UserModel? classify(double featuresAvg) {
    for (var data in _trainingData) {
      print(data.faceLoginValue);
      print(featuresAvg);
      final output=_euclideanDistance(data.faceLoginValue ?? 0.0, featuresAvg);
      if(output){
        return data;
      }
    }
    return null;
  }

  Future<void> detectFaces(InputImage image,BuildContext context,KNNClassifier knn,AsyncCallback onDone) async {
    CustomPopUps.showLottiePopUp(context, AssetsUrl.faceDetectionLottie, AppColors.primaryColor);
    final options=FaceDetectorOptions(enableLandmarks: true,performanceMode: FaceDetectorMode.accurate,enableContours: true);
    final faceDetector = FaceDetector(options: options);
    final faces = await faceDetector.processImage(image);
    if(faces.isNotEmpty) {
      for (Face face in faces) {
        final leftEye = face.landmarks[FaceLandmarkType.leftEye]?.position;
        final leftMouth = face.landmarks[FaceLandmarkType.leftMouth]?.position;
        final leftEar = face.landmarks[FaceLandmarkType.leftEar]?.position;
        final leftCheek = face.landmarks[FaceLandmarkType.leftCheek]?.position;
        final rightEye = face.landmarks[FaceLandmarkType.rightEye]?.position;
        final rightEar = face.landmarks[FaceLandmarkType.rightEar]?.position;
        final rightMouth = face.landmarks[FaceLandmarkType.rightMouth]
            ?.position;
        final rightCheek = face.landmarks[FaceLandmarkType.rightCheek]
            ?.position;
        List<Point<num>> landmarks = [
          leftEye ?? const Point(0.0, 0.0),
          leftMouth ?? const Point(0.0, 0.0),
          leftCheek ?? const Point(0.0, 0.0),
          leftEar ?? const Point(0.0, 0.0),
          rightEye ?? const Point(0, 0),
          rightCheek ?? const Point(0, 0),
          rightEar ?? const Point(0, 0),
          rightMouth ?? const Point(0, 0),
        ];

        final normalizedLandmarks = knn.normalizeLandmarks(landmarks);
        final features = knn.extractFeatures(normalizedLandmarks);
       final authUser= knn.classify(features);
        if(authUser!=null) {
          await session.storeUserInfo(authUser);
          ///closing loader
          Navigator.of(context).pop();
          ///closing loginView
          Navigator.of(context).pop();
          navigate(context);
        }else{
          await onDone();
          ///closing loader
          Navigator.of(context).pop();
          CustomPopUps.showCustomPopUp(context, "User Not Found", Colors.redAccent, "Please Try Again");
        }
        print(authUser);
      }
    }else{
      await onDone();
      Navigator.of(context).pop();
      CustomPopUps.showCustomPopUp(context, "Face Not Detected", Colors.redAccent, "Please Try Again");
    }
  }


  bool _euclideanDistance(double trainedAvg, double inputAvg) {
    trainedAvg=trainedAvg*100;
    inputAvg=inputAvg*100;
    int result=(trainedAvg>inputAvg? trainedAvg-inputAvg : inputAvg-trainedAvg).toInt();
    return result<=3;
  }

  List<Point<double>> normalizeLandmarks(List<Point<num>> landmarks) {
    final leftEye = landmarks[0];
    final rightEye = landmarks[4];

    final centerX = (leftEye.x + rightEye.x) / 2;
    final centerY = (leftEye.y + rightEye.y) / 2;
    final interEyeDistance = sqrt(pow(leftEye.x - rightEye.x, 2) + pow(leftEye.y - rightEye.y, 2));

    return landmarks.map((point) {
      final normalizedX = (point.x - centerX) / interEyeDistance;
      final normalizedY = (point.y - centerY) / interEyeDistance;
      return Point(normalizedX, normalizedY);
    }).toList();
  }

  double extractFeatures(List<Point<double>> normalizedLandmarks) {
    final leftEye = normalizedLandmarks[0];
    final rightEye = normalizedLandmarks[4];
    final leftCheek = normalizedLandmarks[2];
    final rightCheek = normalizedLandmarks[5];
    final leftMouth = normalizedLandmarks[3];
    final rightMouth = normalizedLandmarks[7];

    double distance(Point<double> a, Point<double> b) {
      return double.parse(sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2)).toString().substring(0,5));
    }

    final leftEyeToLeftCheek = distance(leftEye, leftCheek);
    final rightEyeToRightCheek = distance(rightEye, rightCheek);
    final leftMouthToLeftCheek = distance(leftMouth, leftCheek);
    final rightMouthToRightCheek = distance(rightMouth, rightCheek);
    final mouthWidth = distance(leftMouth, rightMouth);
    List<double> result=[
      leftEyeToLeftCheek,
      rightEyeToRightCheek,
      leftMouthToLeftCheek,
      rightMouthToRightCheek,
      mouthWidth,
    ];
    double avg=0.0;
    for (var val in result) {
      avg+=val;
    }
    avg=avg/result.length;
    return avg;
  }

  void navigate(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        CustomRoute.createRoute(page: const NavigatorScreen(), transitionType: TransitionType.fade,
            applyAnimation: true,curve: Curves.ease),
            (route)=>false
    );
  }
}