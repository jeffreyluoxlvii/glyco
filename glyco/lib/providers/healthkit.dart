import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nano_healthkit_plugin/nano_healthkit_plugin.dart';
import 'package:nano_healthkit_plugin/healthdata.pb.dart';
import 'package:nano_healthkit_plugin/healthdata.pbenum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthKit with ChangeNotifier {
  bool isAuthorized = false;
  String glucoseString = "";
  String stepsString = "";
  String statisticsString = "";
  String exisitngTypesString = "";
  String updateMessageString = "";
  bool isSubscribed = false;
  String pulledBackgroundDataString = "";
  String batchString = "";

//author: Nathaniel Hartley

//This code was based off the code you can find for the nano healthkit plugin for flutter
//More in depth explanations about each function can be found in their wiki in their git repo
//If you search nano healthkit flutter you will be able to find the code i got this from

//didnt use
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await NanoHealthkitPlugin.initialize(updatesReceivedInBackground);
    bool _isSubscribed = await NanoHealthkitPlugin.isSubscribedToUpdates();
    this.isSubscribed = _isSubscribed;
  }

// this is the code that makes the pop up for permissions come up when a user first accesses the app
  Future<void> authorize() async {
    var request = HealthTypeList();
    request.types.add(
        HealthTypes.QUANTITY_BLOOD_GLUCOSE); //permissions to real blood glucose
    request.types
        .add(HealthTypes.QUANTITY_STEP_COUNT); // Permissions to read steps
    bool isitAuthorized = await NanoHealthkitPlugin.authorize(request);
    this.isAuthorized = isitAuthorized;
  }

//this code fetches the steps froom the users health app
  Future<void> getUserStepsData() async {
    var request = HealthDataRequest();
    request.type = HealthTypes.QUANTITY_STEP_COUNT;
    var resultToShow = "";
    try {
      var basicHealth = await NanoHealthkitPlugin.fetchData(request);
      resultToShow = basicHealth.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    this.stepsString = resultToShow;
  }

//this code fetched the blood glucose reading from the users health app
  Future<void> getUserGlucoseData() async {
    var request = HealthDataRequest();
    request.type = HealthTypes.QUANTITY_BLOOD_GLUCOSE;
    var resultToShow = "";
    try {
      var basicHealth = await NanoHealthkitPlugin.fetchData(request);
      resultToShow = basicHealth.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    this.glucoseString = resultToShow;
  }

//didn't use this function for the app
  Future<void> getUserBatchData() async {
    // First get the list of existing types
    var existingTypesReq = HealthTypeList();
    existingTypesReq.types.addAll(HealthTypes.values);
    var existingTypes =
        await NanoHealthkitPlugin.filterExistingTypes(existingTypesReq);

    // Make the request for all types
    var requestList = HealthDataRequestList();
    for (var type in existingTypes.types) {
      var typeRequest = HealthDataRequest();
      typeRequest.type = type;
      requestList.requests.add(typeRequest);
    }

    var resultToShow = "";
    try {
      var batchHealth = await NanoHealthkitPlugin.fetchBatchData(requestList);
      print(batchHealth);
      resultToShow = batchHealth.toString();
    } on Exception catch (error) {
      resultToShow = error.toString();
    }
    this.batchString = resultToShow;
  }

//didn't use this function either
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
    this.statisticsString = resultToShow;
  }

//this can be used to fetch all the types of data available to pull from
//didnt use
  Future<void> filterExistingTypes() async {
    var request = HealthTypeList();
    request.types.addAll(HealthTypes.values);
    var filtered = await NanoHealthkitPlugin.filterExistingTypes(request);
    this.exisitngTypesString = filtered.toString();
  }

//didnt use
  Future<void> subscribeToUpdates() {
    var request = HealthTypeList();
    request.types.addAll(HealthTypes.values); // Subscribe to everything
    NanoHealthkitPlugin.subscribeToUpdates(request, updatesReceived);
    this.isSubscribed = true;
    this.updateMessageString = "";
  }

//didnt use
  Future<void> unsubscribeToUpdates() {
    NanoHealthkitPlugin.unsubscribeToUpdates();
    this.isSubscribed = false;
    this.updateMessageString = "";
  }

//didnt use
  Future<void> updatesReceived(HealthDataList updates) {
    saveUpdateData(updates);
    this.updateMessageString = updates.toString();
  }

//didnt use
  Future<void> updatesReceivedInBackground(HealthDataList updates) {
    saveUpdateData(updates);
  }

//didnt use
  Future<void> saveUpdateData(HealthDataList updates) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
    saves.add(updates.toString() + "\n");
    prefs.setStringList("savedUpdates", saves);
  }

//didnt use
  Future<void> pullSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saves = prefs.getStringList("savedUpdates") ?? List<String>();
    this.pulledBackgroundDataString = saves.toString();
    saves.clear();
    prefs.setStringList("savedUpdates", List<String>());
  }
}
