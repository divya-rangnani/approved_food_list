import 'package:built_collection/src/list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_test/bloc/product/approved_food_event.dart';
import 'package:quovantis_test/bloc/product/approved_food_state.dart';
import 'package:quovantis_test/bloc/resources/repository.dart';
import 'package:quovantis_test/model/approved_food.dart';
import 'package:quovantis_test/model/categories.dart';

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
    } else if (event is LoadExpandGroup) {
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
      print('error in LoadApprovedFood method ==> $_');
      yield ApprovedFoodError();
    }
  }

  Stream<ApprovedFoodState> _mapLoadSearchedApprovedFoodToState(
      LoadSearchApprovedFood event) async* {
    try {
      String query = event.strSearch;
      final currentState = state;
      yield ApprovedFoodLoading();
      ApprovedFood _approvedFoodResponse;
      ApprovedFood _searchedApprovedFoodResponse = ApprovedFood();
      if (currentState is ApprovedFoodLoaded) {
        _approvedFoodResponse = currentState.items;
      } else if (currentState is SearchedApprovedFoodLoaded) {
        _approvedFoodResponse = currentState.items;
        /*_approvedFoodResponse = currentState.searchedItems.categories != null &&
            currentState.searchedItems.categories.length > 0
            ? currentState.searchedItems
            : currentState.items;*/
      } else if (currentState is ExpandGroupLoaded) {
        _approvedFoodResponse = currentState.items;
      }
      List<Categories> _newApprovedFoodResponse = [];
      if (query.isNotEmpty) {
        for (int index = 0;
            index < _approvedFoodResponse.categories.length;
            index++) {
          Categories searchedList =
              _approvedFoodResponse.categories.elementAt(index);
          if (searchedList.category.categoryName
              .toLowerCase()
              .contains(query)) {
            _newApprovedFoodResponse.add(searchedList);
            break;
          }
          for (int i = 0; i < searchedList.category.subcategories.length; i++) {
            var subSearchedList =
                searchedList.category.subcategories.elementAt(i);
            if (subSearchedList.subCategoryname.toLowerCase().contains(query)) {
              searchedList =
                  searchedList.rebuild((b) => b..category.isExpandable = true);
              _newApprovedFoodResponse.add(searchedList);
              break;
            }
            for (int j = 0;
                j <
                    searchedList.category.subcategories
                        .elementAt(i)
                        .items
                        .length;
                j++) {
              var subSearchedListItem = searchedList.category.subcategories
                  .elementAt(i)
                  .items
                  .elementAt(j);
              if (subSearchedListItem.toLowerCase().contains(query)) {
                searchedList = searchedList
                    .rebuild((b) => b..category.isExpandable = true);
                _newApprovedFoodResponse.add(searchedList);
                break;
              }
            }
          }
        }
        ListBuilder<Categories> categoriesList = new ListBuilder();
        categoriesList.addAll(_newApprovedFoodResponse);
        if (_newApprovedFoodResponse.length > 0) {
          _searchedApprovedFoodResponse = _searchedApprovedFoodResponse
              .rebuild((b) => b..categories = categoriesList);
        }
      } else {
        _searchedApprovedFoodResponse = ApprovedFood();
      }
      yield SearchedApprovedFoodLoaded(
          items: _approvedFoodResponse,
          searchedItems: _searchedApprovedFoodResponse);
    } catch (_) {
      print('error in SearchedApprovedFood method ==> $_');
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
      } else if (currentState is SearchedApprovedFoodLoaded) {
        _approvedFood = currentState.searchedItems.categories != null &&
                currentState.searchedItems.categories.length > 0
            ? currentState.searchedItems
            : currentState.items;
      } else if (currentState is ExpandGroupLoaded) {
        _approvedFood = currentState.items;
      }
      bool isExpanded = (_approvedFood.categories
                  .elementAt(event.index)
                  .category
                  .isExpandable !=
              null)
          ? !_approvedFood.categories
              .elementAt(event.index)
              .category
              .isExpandable
          : true;
      Categories foodCategory = _approvedFood.categories
          .elementAt(event.index)
          .rebuild((b) => b..category.isExpandable = isExpanded);
      _approvedFood =
          _approvedFood.rebuild((b) => b..categories.removeAt(event.index));
      _approvedFood = _approvedFood
          .rebuild((b) => b..categories.insert(event.index, foodCategory));
      yield ExpandGroupLoaded(items: _approvedFood);
    } catch (_) {
      print('error in LoadExpandGroup method ==> $_');
      yield ApprovedFoodError();
    }
  }
}
