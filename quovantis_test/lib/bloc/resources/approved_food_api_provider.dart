import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quovantis_test/model/approved_food.dart';
import 'package:quovantis_test/utils/CommonApiClass.dart';

class ApprovedFoodApiProvider {
  Future<ApprovedFood> getApprovedFoodList() async {
    Response response = await CommonApiClass.callAPI(
      "https://api.jsonbin.io/b/5fce7e1e2946d2126fff85f0",
      null,
      null,
      0,
    );
    if (response.statusCode == 200 && response.data != null) {
      ApprovedFood approvedFoodResponse =
          ApprovedFood.fromJson(response.data.toString());
      return approvedFoodResponse;
    } else {
      throw Exception('Failed to load schedule');
    }
  }
}
