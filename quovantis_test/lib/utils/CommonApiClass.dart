import 'dart:convert';
import 'dart:core';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonApiClass {
  static String baseUrl;
  static BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
        return false;
      });

  static Dio dio = Dio(options);

  static processJson(jsonString) {
    //added as a background thread to manage the bulk of the json coding. other sections recoded to use the single json decoded object from the callAPI function
    var parsedData = json.decode(jsonString);
    return parsedData;
  }

  // method = 0 - for get, 1 - for post, 2 - for patch
  static Future<dynamic> callAPI(
      String url, Function getResponse, var postData, int method,
      {String strScreen, bool isGuest, bool addToken}) async {
    bool checkInternet;
    await checkNetworkConnection().then((value) {
      checkInternet = value;
    });
    if (checkInternet == true) {
      CancelToken dioToken;
      try {
        dioToken = new CancelToken();
        Response response = await dio.get(url,
            queryParameters: postData, cancelToken: dioToken);

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response;
        } else {
          print('url ==> $url server error $response');
          if (getResponse != null) {
            getResponse(null);
          } else {
            throw 'server error $response';
          }
        }
      } on DioError catch (exception) {
        print(exception);
        showDioError(exception);
        if (getResponse != null) {
          getResponse(null);
        } else {
          throw 'exception => ${exception.message}';
        }
        return null;
      } catch (exception) {
        print('url ==> $url exception $exception');
        if (getResponse != null) {
          getResponse(null);
        } else {
          throw 'exception => $exception';
        }
      }
      return null;
    } else {
      showLToastMessage(
        message: 'Please ensure you have an active internet connection.',
      );
      if (getResponse != null) {
        getResponse(null);
      } else {
        throw 'no internet connection';
      }
      return null;
    }
  }

  static Future checkNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static showDioError(response) {
    if (response.toString().contains('SocketException')) {
      showLToastMessage(
        message: "Please check your network connection",
      );
      return null;
    } else if (response.type == DioErrorType.RECEIVE_TIMEOUT ||
        response.type == DioErrorType.CONNECT_TIMEOUT) {
      showLToastMessage(
        message: "Couldn't connect, please ensure you have a stable network.",
      );
      return null;
    } else {
      showLToastMessage(
        message: "Another Exception",
      );
      return null;
    }
  }

  static void showLToastMessage({message}) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }
}
