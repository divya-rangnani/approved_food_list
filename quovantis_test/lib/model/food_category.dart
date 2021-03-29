library food_category;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quovantis_test/model/serializers.dart';
import 'package:quovantis_test/model/subcategories.dart';
import 'package:built_collection/built_collection.dart';
part 'food_category.g.dart';

abstract class FoodCategory
    implements Built<FoodCategory, FoodCategoryBuilder> {
  FoodCategory._();

  factory FoodCategory([updates(FoodCategoryBuilder b)]) = _$FoodCategory;

  @nullable
  @BuiltValueField(wireName: 'subcategories')
  BuiltList<Subcategories> get subcategories;
  @nullable
  @BuiltValueField(wireName: 'quote')
  String get quote;
  @nullable
  @BuiltValueField(wireName: 'protip')
  String get protip;
  @nullable
  @BuiltValueField(wireName: 'imagePath')
  String get imagePath;
  @nullable
  @BuiltValueField(wireName: 'localImagePath')
  String get localImagePath;
  @nullable
  @BuiltValueField(wireName: 'categoryName')
  String get categoryName;
  @nullable
  @BuiltValueField(wireName: 'colorCode')
  String get colorCode;
  @nullable
  @BuiltValueField(wireName: 'servingSize')
  String get servingSize;
  @nullable
  bool get isExpandable;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FoodCategory.serializer, this));
  }

  static FoodCategory fromJson(String jsonString) {
    return serializers.deserializeWith(
        FoodCategory.serializer, json.decode(jsonString));
  }

  static Serializer<FoodCategory> get serializer => _$foodCategorySerializer;
}
