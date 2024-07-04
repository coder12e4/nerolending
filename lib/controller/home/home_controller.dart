import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import '../../../backend/model/getAgentList_model/getagentlist_model_data.dart';
import '../../../backend/model/getcatogery_model/getcatogery_model_data.dart';
import '../../../backend/model/getlocation_model/getlocation_data_model.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../backend/parser/home/home_parser.dart';
import '../connectivity/connectivity_checker.dart';

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;
  HomeController({required this.parser});

  RxList<Groups> todoList = <Groups>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

/*
  @override
  void onReady() {
    log("internet connection $isInternetOn");

    //readHomeData();

    */
/*  getLocation();
    getCatogery();
    getAgentList();
    updateSelectedCategoryIndex(0);
    categorySelection(-1);*/ /*

    confirmationResult.value = false;

    super.onReady();
  }
*/

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Groups>> todoStream(String? serach) {
    return firestore
        .collection("homedata")
        .where(serach!)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Groups> retVal = [];
      retVal.clear();
      query.docs.forEach((element) {
        retVal.add(Groups.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  final ConnectivityService _connectivityService =
      Get.put(ConnectivityService());
  bool get isInternetOn => _connectivityService.isInternetOn.value;
  int selectedCategoryIndex = 0;
  String accessToken = "";
  List<LocationData> locationData = <LocationData>[];
  LocationData? location;
  CatogoryData? category;
  RxnString country = RxnString(null);
  int categoryIndex = 0;
  int? selectedNoOfMaid = 0;
  RxBool confirmationResult = RxBool(false);
  List<CatogoryData> categoryData = <CatogoryData>[];
  List<CatogoryData> dropDownCategoryData = <CatogoryData>[];
  List<AgentListData> agentListData = <AgentListData>[];
  String agentImage = "";
  List<Map<String, dynamic>> categoryItems = [
    {"name": "All", "image": "assets/images/Vector.png"},
    {"name": "Maid", "image": "assets/images/mop_2780505 1.png"},
    {"name": "Driver", "image": "assets/images/steering-wheel_3190249 1.png"},
    {"name": "Gardener", "image": "assets/images/leaves-plant_45777 1.png"},
  ];

  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  List<DropdownMenuItem<LocationData>> _dropdownMenuItemsLocationData =
      <DropdownMenuItem<LocationData>>[];
  List<DropdownMenuItem<LocationData>> get dropdownMenuItemsLocationData =>
      _dropdownMenuItemsLocationData;

  List<DropdownMenuItem<CatogoryData>> _dropdownMenuItemsCategory =
      <DropdownMenuItem<CatogoryData>>[];
  List<DropdownMenuItem<CatogoryData>> get dropdownMenuItemsCategory =>
      _dropdownMenuItemsCategory;

  LocationData? selecteValue;
  String? selectedWageMode;
  String? selectedRating;
  LocationData? selectedLocation;
  CatogoryData? selectedCategory;
  RxInt locationValue = RxInt(1);
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxBool isPressed = false.obs;
  RxnString firstLocation = RxnString("");

  RxInt categoryValue = RxInt(0);
  List<DropdownMenuItem<LocationData>> homeDropDownList = [
    // const DropdownMenuItem(
    //   value: "Al Jaddaf",
    //   child: Text("Al Jaddaf"),
    // ),
    // const DropdownMenuItem(
    //   value: "Dubai",
    //   child: Text("Dubai"),
    // ),
    // const DropdownMenuItem(
    //   value: "Sharjah",
    //   child: Text("Sharjah"),
    // ),
    // const DropdownMenuItem(
    //   value: "Madeena",
    //   child: Text("Madeena"),
    // ),
  ];
  void categorySelection(int index) {
    categoryIndex = index;
    log("categorySelection : $categoryIndex");
    update();
  }

  // Add a function to update the selected category index
  void updateSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  Future<void> showExitConfirmationDialog() async {
    confirmationResult.value = await Get.defaultDialog(
      title: 'Confirm Exit',
      content: const Text('Are you sure you want to exit the app?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true);
            SystemNavigator.pop();
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () => Get.back(result: false),
          child: const Text('No'),
        ),
      ],
    );
  }

  final List<DropdownMenuItem<String>> dropDownWageMode = [
    const DropdownMenuItem(
      value: "Hourly Wage",
      child: Text("Hourly Wage"),
    ),
    const DropdownMenuItem(
      value: "Daily Wage",
      child: Text("Daily Wage"),
    ),
  ];
  final List<DropdownMenuItem<String>> dropDownRating = [
    const DropdownMenuItem(
      value: "1",
      child: Text("1"),
    ),
    const DropdownMenuItem(
      value: "2",
      child: Text("2"),
    ),
    const DropdownMenuItem(
      value: "3",
      child: Text("3"),
    ),
    const DropdownMenuItem(
      value: "4 & above",
      child: Text("4 & above"),
    ),
  ];
  void categoryOnchange(newValue) {
    selectedCategory = newValue;
    update();
  }

  void locationOnchange(LocationData? newValue) {
    selectedLocation = newValue;
    update();
  }

  void ratingOnchange(String? newValue) {
    selectedRating = newValue;
    update();
  }

  void maidSelection(newValue) {
    selectedWageMode = newValue;
    update();
  }

  void noOfMaidSelection(index) {
    selectedNoOfMaid = index;
    update();
  }

  void wageModeSelection(int index) {
    categoryIndex = index;
    log("categorySelection : $categoryIndex");
    update();
  }

  Future<void> getLocation() async {
    loadingWidget();

    Response response = await parser.getLocationFunction();
    locationData.clear();
    if (response.statusCode == 200) {
      Get.back();
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);

      var allLocations = myMap['data'];

      locationData = [];

      allLocations.forEach((data) {
        LocationData individual = LocationData.fromJson(data);
        locationData.add(individual);
      });
      firstLocation.value = locationData[0].name;
      log("LocationData${locationData[0].name.toString()}");
      print("LocationData${locationData[0].name.toString()}");

      // homeDropDownList = locationData;
      _dropdownMenuItemsLocationData =
          buildDropDownMenuItemsLocationData(locationData);
      location != null ? _dropdownMenuItemsLocationData[0].value : null;
    }
    update();
  }

  Future<void> getCatogery() async {
    accessToken = parser.sharedPreferencesManager.getString("accessToken")!;
    log("Access Token : $accessToken");
    Response response = await parser.getCatogeryFunction();
    loadingWidget();
    log("catogery check ${response.body}");
    try {
      categoryData.clear();
      dropDownCategoryData.clear();
      if (response.statusCode == 200) {
        Get.back();
        Catogery catogeryResponse = Catogery.fromJson(response.body);
        List<CatogoryData> collection = catogeryResponse.data;
        for (CatogoryData element in collection) {
          CatogoryData data = element;
          categoryData.add(data);
        }
        dropDownCategoryData = [];
        categoryData.forEach((data) {
          CatogoryData individual = data;
          dropDownCategoryData.add(individual);
        });
        _dropdownMenuItemsCategory =
            buildDropDownMenuItemsCategory(dropDownCategoryData);
        category != null ? _dropdownMenuItemsCategory[0].value : null;
        log("catagorey${categoryData[1].name.toString()}");
      } else {
        showToast('error}');
      }
    } catch (e, stackTrace) {
      log('getCatogery catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }

  Future<void> getAgentList() async {
    Map<String, dynamic> body = {};

    // Add locationValue to the body only if it is not 0
    if (locationValue.value != 0) {
      body["status"] = locationValue.value;
    } else {
      body["status"] = 1;
    }
    if (searchController.value != null && searchController.value != "") {
      body["search"] = searchController.value.text;
    }
    if (categoryValue.value != 0) {
      body["category"] = categoryValue.value;
    }
    Response response = await parser.getAgentFunction(body);
    loadingWidget();
    try {
      agentListData.clear();
      if (response.statusCode == 200) {
        Get.back();
        AgentList catogeryResponse = AgentList.fromJson(response.body);
        List<AgentListData> collection = catogeryResponse.data;
        for (AgentListData element in collection) {
          AgentListData data = element;
          agentListData.add(data);
        }
        log("agentListData function${agentListData.toString()}");
      } else {
        showToast('error');
      }
    } catch (e, stackTrace) {
      log('agentListData catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }

  List<DropdownMenuItem<LocationData>> buildDropDownMenuItemsLocationData(
      List listItems) {
    List<DropdownMenuItem<LocationData>> items = [];
    for (LocationData listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: .1,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    return items;
  }

  List<DropdownMenuItem<CatogoryData>> buildDropDownMenuItemsCategory(
      List listItems) {
    List<DropdownMenuItem<CatogoryData>> items = [];
    for (CatogoryData listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: .1,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    return items;
  }

  //read home data
  List<Groups> k = [];
  List<Groups> listgroup = [];

  final FirebaseFirestore _db = FirebaseFirestore.instance;

/*
  readHomeData() async {
    try {
      await firestore
          .collection('homedata')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          listgroup.add(new Groups(
              name: doc["name"],
              section_img: doc["section_img"],
              description: doc["discription"]));
        });
        update();
      });
    } catch (e) {
      print(e);
    }
  }
*/
}

class Groups {
  final String id;
  final String name;
  final String description;
  final String section_img;
  Groups({
    required this.id,
    required this.name,
    required this.description,
    required this.section_img,
  });

  // Factory constructor to create an ItemModel from a DocumentSnapshot
  factory Groups.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Groups(
        id: doc.id,
        name: doc['name'],
        description: doc['discription'],
        section_img: doc['section_img']);
  }

  // Method to convert an ItemModel to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'section_img': section_img
    };
  }
}

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<Groups>> todoStream() {
    try {
      return firestore
          .collection("homedata")
          .snapshots()
          .map((QuerySnapshot query) {
        List<Groups> retVal = [];
        query.docs.forEach((element) {
          retVal.add(Groups.fromDocumentSnapshot(element));
        });
        return retVal;
      });
    } catch (e) {
      print(e);
      return null!;
    }
  }
}
