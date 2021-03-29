import 'dart:math';

import 'package:dio/dio.dart';
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
import 'package:quovantis_test/utils/CommonApiClass.dart';

class ApprovedFoodList extends StatefulWidget {
  ApprovedFoodList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ApprovedFoodListState createState() => _ApprovedFoodListState();
}

BoxDecoration commonBorderLines() {
  return BoxDecoration(
    color: Colors.black12,
    border: Border.all(width: 2, color: Colors.black12),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
}

class _ApprovedFoodListState extends State<ApprovedFoodList> {
  TextEditingController searchController = new TextEditingController();

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

  ApprovedFood _approvedFoodResponse;
  BuildContext _context;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApprovedFoodBloc>(
      create: (context) =>
          ApprovedFoodBloc(ApprovedFoodLoading())..add(LoadApprovedFood()),
      child: BlocBuilder<ApprovedFoodBloc, ApprovedFoodState>(
          builder: (BuildContext context, ApprovedFoodState state) {
        try {
          _context = context;
          if (state is ApprovedFoodLoaded) {
            _approvedFoodResponse = state?.items;
          } else if (state is ExpandGroupLoaded) {
            if (state?.items != null) _approvedFoodResponse = state?.items;
          }
        } catch (e) {
          print(e);
        }

        return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: (_approvedFoodResponse?.categories != null)
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(16.0),
                        decoration: commonBorderLines(),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, top: 2, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Flexible(
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
                                    CommonApiClass.showLToastMessage(
                                        message: 'search submitted');
                                  },
                                  controller: searchController,
                                ),
                                flex: 7,
                                fit: FlexFit.tight,
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 50,
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        searchController.text != null
                                            ? Icons.close
                                            : Icons.search,
                                      )),
                                ),
                                flex: 1,
                                fit: FlexFit.tight,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children:
                                _approvedFoodResponse.categories.map((group) {
                              int index = _approvedFoodResponse.categories
                                  .indexOf(group);
                              return Container(
                                margin: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    )),
                                child: _wrapCategories(
                                    _approvedFoodResponse.categories
                                        .elementAt(index),
                                    index),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                        /*(state.error != null)
            ? snapshot.error
            :*/
                        'Loading data...'),
                  ));
      }),
    );
  }

  Widget _headerCategory(String name, bool isExpandable, int _index, String colorCode,
          String servingSize) =>
      name!=null&&name.isNotEmpty?GestureDetector(
        onTap: () => BlocProvider.of<ApprovedFoodBloc>(_context)
            .add(LoadExpandGroup(index: _index)),
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: /*generateRandomColor()*/ HexColor
                                      .fromHex(colorCode)),
                              children: <TextSpan>[
                                servingSize!=null?TextSpan(
                          text: ' ($servingSize)',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colorCode==null?generateRandomColor() : HexColor
                                  .fromHex(colorCode)),
                        ):TextSpan()
                      ]))),
                  Icon(isExpandable != null && isExpandable
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                ],
              ),
              isExpandable!=null && isExpandable?Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Divider(),
              ):Container()
            ],
          ),
        ),
      ):Container();

  Color generateRandomColor() {
    Random random = Random();

    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }

  Widget _headerSubCategory(String name, String colorCode) => name!=null&&name.isNotEmpty?Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Text(name,
          style: TextStyle(
            fontSize: 16,
              color: colorCode==null?generateRandomColor() :HexColor
                  .fromHex(colorCode),
            fontWeight: FontWeight.bold,
          ))):Container();

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
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        children: children,
      ),
    );
    //return ExpandableGroup(header: header, items: items)
  }

  List<Widget> _wrapCategory(BuildContext context,
          List<Subcategories> subItems, bool isExpandable) =>
      subItems
          .map(
            (e) => Visibility(
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
    _children.add(_headerSubCategory(subcategories.subCategoryname,subcategories.colorCode));
    _children.add(Divider());
    _children.addAll(_wrapSubCategory(context, subcategories.items.toList()));

    return Ink(
      color: Theme.of(context).appBarTheme.color,
      child: Column(
        children: _children,
      ),
    );
  }

  List<Widget> _wrapSubCategory(BuildContext context, List<String> items) => items
      .map(
        (e) => Column(
          children: [
            ListTile(
              title: Text(e),
            ),
            Divider()
          ],
        ),
      )
      .toList();
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
