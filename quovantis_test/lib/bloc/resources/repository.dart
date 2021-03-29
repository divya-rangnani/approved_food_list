import 'package:quovantis_test/bloc/resources/approved_food_api_provider.dart';
import 'package:quovantis_test/model/approved_food.dart';

class Repository {
  //product listing
  final productsApiProvider = ApprovedFoodApiProvider();

  Future<ApprovedFood> fetchFeaturedData() =>
      productsApiProvider.getApprovedFoodList();
}
