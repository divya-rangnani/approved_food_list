import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quovantis_test/model/approved_food.dart';

abstract class ApprovedFoodEvent extends Equatable {
  const ApprovedFoodEvent();
}

class LoadApprovedFood extends ApprovedFoodEvent {
  const LoadApprovedFood();
  @override
  List<Object> get props => [];
}

class LoadSearchApprovedFood extends ApprovedFoodEvent {
  final BuildContext context;
  final String strSearch;
  const LoadSearchApprovedFood(this.context, this.strSearch);
  @override
  List<Object> get props => [context, strSearch];
}

class LoadExpandGroup extends ApprovedFoodEvent {
  final int index;

  const LoadExpandGroup({this.index});

  @override
  List<Object> get props => [index];
}
