import 'package:equatable/equatable.dart';
import 'package:quovantis_test/model/approved_food.dart';

abstract class ApprovedFoodState extends Equatable {
  const ApprovedFoodState();
}

class ApprovedFoodLoading extends ApprovedFoodState {
  @override
  List<Object> get props => [];
}

class ApprovedFoodLoaded extends ApprovedFoodState {
  final ApprovedFood items;

  const ApprovedFoodLoaded({this.items});

  @override
  List<Object> get props => [items];
}

class ApprovedFoodSearchLoading extends ApprovedFoodState {
  @override
  List<Object> get props => [];
}

class SearchedApprovedFoodLoaded extends ApprovedFoodState {
  final ApprovedFood items;

  const SearchedApprovedFoodLoaded({this.items});

  @override
  List<Object> get props => [items];
}

class ExpandGroupLoaded extends ApprovedFoodState {
  final ApprovedFood items;

  const ExpandGroupLoaded({this.items});

  @override
  List<Object> get props => [items];
}

class ApprovedFoodError extends ApprovedFoodState {
  @override
  List<Object> get props => [];
}
