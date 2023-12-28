import 'package:flutter/cupertino.dart';
// import 'package:screen_design/models/training_schedule_model.dart';
// import 'package:screen_design/service/trainer_service.dart';
//
// import '../models/trainer_model.dart';

class TrainerProvider extends ChangeNotifier {
  //List<TrainerModel> trainerModelList = [];
  String? trainerImage;
  String? trainerName;
  //TrainerModel? categoryDetailPageTrainerModel;
 /// List<TrainingScheduleModel> trainingSchedulesByBatchIdList = [];
 // List<TrainingScheduleModel> allTrainingSchedulesList = [];

  getTrainerServiceData() async {
   // dynamic data = await TrainerService.getTrainerData();

    //for (Map i in data) {
     // trainerModelList.add(TrainerModel.fromJson(i));
    }
    notifyListeners();
  }

