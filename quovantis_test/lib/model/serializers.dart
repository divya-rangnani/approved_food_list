library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:quovantis_test/model/approved_food.dart';
import 'package:quovantis_test/model/categories.dart';
import 'package:quovantis_test/model/food_category.dart';
import 'package:quovantis_test/model/subcategories.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [ApprovedFood, Categories, FoodCategory, Subcategories])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
