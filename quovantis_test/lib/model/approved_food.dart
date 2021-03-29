library approved_food;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:quovantis_test/model/serializers.dart';

import 'categories.dart';

part 'approved_food.g.dart';

abstract class ApprovedFood
    implements Built<ApprovedFood, ApprovedFoodBuilder> {
  ApprovedFood._();

  factory ApprovedFood([updates(ApprovedFoodBuilder b)]) = _$ApprovedFood;

  @nullable
  @BuiltValueField(wireName: 'categories')
  BuiltList<Categories> get categories;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ApprovedFood.serializer, this));
  }

  static ApprovedFood fromJson(String jsonString) {
    return serializers.deserializeWith(
        ApprovedFood.serializer, json.decode(jsonString));
  }

  static Serializer<ApprovedFood> get serializer => _$approvedFoodSerializer;
}
