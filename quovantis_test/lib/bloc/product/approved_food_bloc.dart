import 'package:built_collection/src/list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_test/bloc/product/approved_food_event.dart';
import 'package:quovantis_test/bloc/product/approved_food_state.dart';
import 'package:quovantis_test/bloc/resources/repository.dart';
import 'package:quovantis_test/model/approved_food.dart';
import 'package:quovantis_test/model/categories.dart';
import 'package:quovantis_test/model/food_category.dart';

class ApprovedFoodBloc extends Bloc<ApprovedFoodEvent, ApprovedFoodState> {
  final _repository = Repository();
  ApprovedFoodBloc(ApprovedFoodState initialState) : super(initialState);

  bool enableSearch = false;
  ApprovedFood responseModel;

  @override
  Stream<ApprovedFoodState> mapEventToState(
    ApprovedFoodEvent event,
  ) async* {
    if (event is LoadApprovedFood) {
      yield* _mapLoadApprovedFoodToState(event);
    } else if (event is LoadSearchApprovedFood) {
      yield* _mapLoadSearchedApprovedFoodToState(event);
    }else if (event is LoadExpandGroup) {
      yield* _mapLoadExpandGroupToState(event);
    }
  }

  Stream<ApprovedFoodState> _mapLoadApprovedFoodToState(
      LoadApprovedFood event) async* {
    yield ApprovedFoodLoading();
    try {
      ApprovedFood approvedFood = await _repository.fetchFeaturedData();
      yield ApprovedFoodLoaded(items: approvedFood);
    } catch (_) {
      print('error in ApprovedFood ==> $_');
      yield ApprovedFoodError();
    }
  }

  Stream<ApprovedFoodState> _mapLoadSearchedApprovedFoodToState(
      LoadSearchApprovedFood event) async* {
    try {
      yield ApprovedFoodSearchLoading();
      ApprovedFood approvedFood = await _repository.fetchFeaturedData();
      yield SearchedApprovedFoodLoaded(items: approvedFood);
    } catch (_) {
      print('error in ApprovedFood ==> $_');
      yield ApprovedFoodError();
    }
  }

  Stream<ApprovedFoodState> _mapLoadExpandGroupToState(
      LoadExpandGroup event) async* {
    try {
      final currentState = state;
      ApprovedFood _approvedFood;
      if (currentState is ApprovedFoodLoaded) {
        _approvedFood = currentState.items;
      }else if (currentState is SearchedApprovedFoodLoaded) {
        _approvedFood = currentState.items;
      }else if (currentState is ExpandGroupLoaded) {
        _approvedFood = currentState.items;
      }
      bool isExpanded =(_approvedFood.categories.elementAt(event.index).category.isExpandable!=null)?!_approvedFood.categories.elementAt(event.index).category.isExpandable :true;
      Categories foodCategory = _approvedFood.categories.elementAt(event.index).rebuild((b) => b..category.isExpandable=isExpanded);
      _approvedFood = _approvedFood.rebuild((b) => b..categories.removeAt(event.index)) ;
      _approvedFood = _approvedFood.rebuild((b) => b..categories.insert(event.index,foodCategory)) ;
      yield ExpandGroupLoaded(items:_approvedFood);

    } catch (_) {
      print('error in ApprovedFood ==> $_');
      yield ApprovedFoodError();
    }
  }
}
