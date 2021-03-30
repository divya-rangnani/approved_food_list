import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_test/bloc/product/approved_food_bloc.dart';
import 'package:quovantis_test/bloc/product/approved_food_event.dart';
import 'package:quovantis_test/bloc/product/approved_food_state.dart';
import 'package:quovantis_test/model/approved_food.dart';
import 'package:quovantis_test/model/categories.dart';
import 'package:quovantis_test/model/subcategories.dart';
import 'package:quovantis_test/utils/CommonMethods.dart';
import 'package:substring_highlight/substring_highlight.dart';

class ApprovedFoodList extends StatefulWidget {
  ApprovedFoodList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ApprovedFoodListState createState() => _ApprovedFoodListState();
}

class _ApprovedFoodListState extends State<ApprovedFoodList> {
  TextEditingController _searchController = new TextEditingController();

  ApprovedFood _approvedFoodResponse;
  ApprovedFood _searchedApprovedFoodResponse = ApprovedFood();
  BuildContext _context;

  _ApprovedFoodListState() {
    _searchController.addListener(() {
      _searchTextChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApprovedFoodBloc>(
      create: (context) =>
      ApprovedFoodBloc(ApprovedFoodLoading())
        ..add(LoadApprovedFood()),
      child: BlocBuilder<ApprovedFoodBloc, ApprovedFoodState>(
          builder: (BuildContext context, ApprovedFoodState state) {
            try {
              _context = context;
              if (state is ApprovedFoodLoaded) {
                _approvedFoodResponse = state?.items;
              } else if (state is ExpandGroupLoaded) {
                if (_searchedApprovedFoodResponse?.categories != null &&
                    _searchedApprovedFoodResponse.categories.length > 0)
                  _searchedApprovedFoodResponse = state?.items;
                else
                if (state?.items != null) _approvedFoodResponse = state?.items;
              } else if (state is SearchedApprovedFoodLoaded) {
                if (state?.searchedItems != null) {
                  _searchedApprovedFoodResponse = state?.searchedItems;
                } else {
                  if (state?.items != null)
                    _approvedFoodResponse = state?.items;
                }
              }
            } catch (e) {
              print(e);
            }

            return Scaffold(
                backgroundColor: Color.fromRGBO(234, 233, 239, 1.0),
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(234, 233, 239, 1.0),
                  elevation: 0,
                  //title: Text(widget.title),
                  leading: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 32,
                        color: Colors.black,
                      )),
                ),
                body: (_approvedFoodResponse?.categories != null)
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 16, right: 16),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.0),
                      decoration: commonBorderLines(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 2, bottom: 2),
                        child: TextField(
                          maxLines: 1,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'search here',
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            _searchTextChanged();
                          },
                          //onChanged: _searchTextChanged(),
                          controller: _searchController,
                        ),
                      ),
                    ),
                    Expanded(
                        child: (_searchedApprovedFoodResponse?.categories ==
                            null ||
                            _searchedApprovedFoodResponse
                                .categories.length ==
                                0)
                            ? (_searchController.text.isEmpty)
                            ? _manageList(_approvedFoodResponse)
                            : Center(child: Text('Empty search results'))
                            : _manageList(_searchedApprovedFoodResponse))
                  ],
                )
                    : Center(
                  child: Text('Loading data...'),
                ));
          }),
    );
  }

  Widget _manageList(ApprovedFood approvedFood) {
    return SingleChildScrollView(
        child: Column(
          children: approvedFood.categories.map((group) {
            int index = approvedFood.categories.indexOf(group);
            return Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  )),
              child:
              _wrapCategories(approvedFood.categories.elementAt(index), index),
            );
          }).toList(),
        ));
  }

  Widget _headerCategory(String name, bool isExpandable, int _index,
      String colorCode, String servingSize) =>
      name != null && name.isNotEmpty
          ? GestureDetector(
        onTap: () =>
            BlocProvider.of<ApprovedFoodBloc>(_context)
                .add(LoadExpandGroup(index: _index)),
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: _searchController.text != null &&
                          _searchController.text.isNotEmpty
                          ? SubstringHighlight(
                          text: '$name ($servingSize)',
                          term: _searchController.text,
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: /*generateRandomColor()*/ HexColor
                                  .fromHex(colorCode)))
                          : RichText(
                          text: TextSpan(
                              text: name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: /*generateRandomColor()*/ HexColor
                                      .fromHex(colorCode)),
                              children: <TextSpan>[
                                servingSize != null
                                    ? TextSpan(
                                  text: ' ($servingSize)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: colorCode == null
                                          ? generateRandomColor()
                                          : HexColor.fromHex(
                                          colorCode)),
                                )
                                    : TextSpan()
                              ]))),
                  Icon(isExpandable != null && isExpandable
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                ],
              ),
              isExpandable != null && isExpandable
                  ? Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Divider(),
              )
                  : Container()
            ],
          ),
        ),
      )
          : Container();

  Color generateRandomColor() {
    Random random = Random();

    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }

  Widget _headerSubCategory(String name, String colorCode) =>
      Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: SubstringHighlight(
              text: name,
              term: _searchController.text,
              textStyleHighlight: TextStyle(
                fontSize: 16,
                color: colorCode == null
                    ? generateRandomColor()
                    : HexColor.fromHex(colorCode),
                fontWeight: FontWeight.bold,
              )));

  Widget _wrapCategories(Categories categories, int index) {
    List<Widget> children = [];
    children.add(_headerCategory(
        categories.category.categoryName,
        categories.category.isExpandable,
        index,
        categories.category.colorCode,
        categories.category.servingSize));
    children.addAll(_wrapCategory(
        context,
        categories.category.subcategories.toList(),
        categories.category.isExpandable));
    return Ink(
      color: Theme
          .of(context)
          .appBarTheme
          .color,
      child: Column(
        children: children,
      ),
    );
    //return ExpandableGroup(header: header, items: items)
  }

  List<Widget> _wrapCategory(BuildContext context, List<Subcategories> subItems,
      bool isExpandable) =>
      subItems
          .map(
            (e) =>
            Visibility(
              visible: isExpandable != null && isExpandable,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: subItems.map((group) {
                  int index = subItems.indexOf(group);
                  return _wrapSubCategories(subItems.elementAt(index));
                }).toList(),
              ),
            ),
      )
          .toList();

  Widget _wrapSubCategories(Subcategories subcategories) {
    List<Widget> _children = [];
    subcategories?.subCategoryname != null &&
        subcategories.subCategoryname.isNotEmpty
        ? _children.add(_headerSubCategory(
        subcategories.subCategoryname, subcategories.colorCode))
        : Container();
    subcategories?.subCategoryname != null &&
        subcategories.subCategoryname.isNotEmpty
        ? _children.add(Divider())
        : Container();
    _children.addAll(_wrapSubCategory(context, subcategories.items.toList()));

    return Ink(
      color: Theme
          .of(context)
          .appBarTheme
          .color,
      child: Column(
        children: _children,
      ),
    );
  }

  List<Widget> _wrapSubCategory(BuildContext context, List<String> items) =>
      items
          .map(
            (e) =>
            Column(
              children: [
                ListTile(
                    title: SubstringHighlight(
                        text: e, term: _searchController.text)),
                Divider()
              ],
            ),
      )
          .toList();

  String query;

  _searchTextChanged() {
    if (query == null || _searchController.text.toLowerCase() != query) {
      query = _searchController.text.toLowerCase();
      BlocProvider.of<ApprovedFoodBloc>(_context)
          .add(LoadSearchApprovedFood(_context, query));
    }
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
