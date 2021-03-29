library subcategories;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quovantis_test/model/serializers.dart';

part 'subcategories.g.dart';

abstract class Subcategories
    implements Built<Subcategories, SubcategoriesBuilder> {
  Subcategories._();

  factory Subcategories([updates(SubcategoriesBuilder b)]) = _$Subcategories;

  @nullable
  @BuiltValueField(wireName: 'items')
  BuiltList<String> get items;
  @nullable
  @BuiltValueField(wireName: 'subCategoryname')
  String get subCategoryname;
  @nullable
  @BuiltValueField(wireName: 'colorCode')
  String get colorCode;
  String toJson() {
    return json
        .encode(serializers.serializeWith(Subcategories.serializer, this));
  }

  static Subcategories fromJson(String jsonString) {
    return serializers.deserializeWith(
        Subcategories.serializer, json.decode(jsonString));
  }

  static Serializer<Subcategories> get serializer => _$subcategoriesSerializer;
}
