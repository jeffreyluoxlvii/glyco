import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nano_healthkit_plugin/nano_healthkit_plugin.dart';
import 'package:nano_healthkit_plugin/healthdata.pb.dart';
import 'package:nano_healthkit_plugin/healthdata.pbenum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthKit with ChangeNotifier {
  bool isAuthorized = false;
  String bloodHealthString = "";
  String stepsHealthString = "";
  String statisticsString = "";
  String exisitngTypesString = "";
  String updateMessageString = "";
  bool isSubscribed = false;
  String pulledBackgroundDataString = "";
  String batchString = "";

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await NanoHealthkitPlugin.initialize(updatesReceivedInBackground);
    bool _isSubscribed = await NanoHealthkitPlugin.isSubscribedToUpdates();
    // setState(() {
    this.isSubscribed = _isSubscribed;
    // });
  }

  Future<void> authorize() async {
    var request = HealthTypeList();
    request.types.add(
        HealthTypes.QUANTITY_BLOOD_GLUCOSE); //permissions to real blood glucose
    request.types
        .add(HealthTypes.QUANTITY_STEP_COUNT); // Permissions to read steps
    bool isitAuthorized = await NanoHealthkitPlugin.authorize(request);
    // setState(() {
    this.isAuthorized = isitAuthorized;
    // });
  }

  Future<void> getUserBloodGlucose() async {
    var request = HealthDataRequest();
    request.type = HealthTypes.QUANTITY_BLOOD_GLUCOSE;
    //request.startDate = "2019-06-19T18:58:00.000Z";
    //request.endDate = "2019-09-19T20:58:00.000Z";
    //request.limit = 2;
    //request.units.add("ft");
    // request.units.add("kcal");
    // request.units.add("km");
    var resultToShow = "";
    try {
      var basicHealth = await NanoHealthkitPlugin.fetchData(request);
      resultToShow = basicHealth.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    // setState(() {
    this.bloodHealthString = resultToShow;
    // });
  }

  Future<void> getUserSteps() async {
    var request = HealthDataRequest();
    request.type = HealthTypes.QUANTITY_STEP_COUNT;
    //request.startDate = "2019-06-19T18:58:00.000Z";
    //request.endDate = "2019-09-19T20:58:00.000Z";
    //request.limit = 2;
    //request.units.add("ft");
    // request.units.add("kcal");
    // request.units.add("km");
    var resultToShow = "";
    try {
      var basicHealth = await NanoHealthkitPlugin.fetchData(request);
      resultToShow = basicHealth.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    // setState(() {
    this.stepsHealthString = resultToShow;
    // });
  }

  // Future<void> getUserBatchData() async {
  //   // First get the list of existing types
  //   var existingTypesReq = HealthTypeList();
  //   existingTypesReq.types.addAll(HealthTypes.values);
  //   var existingTypes =
  //       await NanoHealthkitPlugin.filterExistingTypes(existingTypesReq);

  //   // Make the request for all types
  //   var requestList = HealthDataRequestList();
  //   for (var type in existingTypes.types) {
  //     var typeRequest = HealthDataRequest();
  //     typeRequest.type = type;
  //     requestList.requests.add(typeRequest);
  //   }

  //   var resultToShow = "";
  //   try {
  //     var batchHealth = await NanoHealthkitPlugin.fetchBatchData(requestList);
  //     print(batchHealth);
  //     resultToShow = batchHealth.toString();
  //   } on Exception catch (error) {
  //     resultToShow = error.toString();
  //   }
  //   // setState(() {
  //   this.batchString = resultToShow;
  //   // });
  // }

  Future<void> getUserStatisticsData() async {
    var request = StatisticsRequest();
    request.type = HealthTypes.QUANTITY_HEART_RATE;
    request.options.add(StatisticsOptions.DISCRETE_MAX);
    request.options.add(StatisticsOptions.DISCRETE_MIN);
    request.options.add(StatisticsOptions.DISCRETE_AVERAGE);
    request.options.add(StatisticsOptions.SEPARATE_BY_SOURCE);
    var resultToShow = "";
    try {
      var result = await NanoHealthkitPlugin.fetchStatisticsData(request);
      resultToShow = result.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    // setState(() {
    this.statisticsString = resultToShow;
    // });
  }

  Future<void> filterExistingTypes() async {
    var request = HealthTypeList();
    request.types.addAll(HealthTypes.values);
    var filtered = await NanoHealthkitPlugin.filterExistingTypes(request);
    // setState(() {
    this.exisitngTypesString = filtered.toString();
    // });
  }

  Future<void> subscribeToUpdates() async {
    var request = HealthTypeList();
    request.types.addAll(HealthTypes.values); // Subscribe to everything
    NanoHealthkitPlugin.subscribeToUpdates(request, updatesReceived);
    // setState(() {
    this.isSubscribed = true;
    this.updateMessageString = "";
    // });
  }

  Future<void> unsubscribeToUpdates() {
    NanoHealthkitPlugin.unsubscribeToUpdates();
    // setState(() {
    this.isSubscribed = false;
    this.updateMessageString = "";
    // });
  }

  Future<void> updatesReceived(HealthDataList updates) {
    saveUpdateData(updates);
    // setState(() {
    this.updateMessageString = updates.toString();
    // });
  }

  Future<void> updatesReceivedInBackground(HealthDataList updates) {
    saveUpdateData(updates);
  }

  Future<void> saveUpdateData(HealthDataList updates) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
    saves.add(updates.toString() + "\n");
    prefs.setStringList("savedUpdates", saves);
  }

  Future<void> pullSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
    // setState(() {
    this.pulledBackgroundDataString = saves.toString();
    // });
    saves.clear();
    prefs.setStringList("savedUpdates", List<String>());
  }
}
