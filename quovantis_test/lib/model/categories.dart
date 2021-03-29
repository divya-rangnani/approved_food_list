library categories;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quovantis_test/model/serializers.dart';

import 'food_category.dart';

part 'categories.g.dart';

abstract class Categories implements Built<Categories, CategoriesBuilder> {
  Categories._();

  factory Categories([updates(CategoriesBuilder b)]) = _$Categories;

  @nullable
  @BuiltValueField(wireName: 'category')
  FoodCategory get category;
  String toJson() {
    return json.encode(serializers.serializeWith(Categories.serializer, this));
  }

  static Categories fromJson(String jsonString) {
    return serializers.deserializeWith(
        Categories.serializer, json.decode(jsonString));
  }

  static Serializer<Categories> get serializer => _$categoriesSerializer;
}
