import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_app/data/api/api_services.dart';

class MockApiServices extends Mock implements ApiServices {}

void main() {
  late ApiServices apiServices;
  const successMessagesResponse = 'success';
  const errorSuccessResponse = false;
  const validInputReviews = 'Test Review';
  const validInputNames = 'Test Name';
  const invalidRestaurantId = 'xxxxx';
  const emptyErrorResponses = true;
  const validRestaurantId = 'rqdv5juczeskfw1e867';
  const emptyMessageResponses = 'restaurant tidak ditemukan';

  
  setUp(() {
    apiServices = MockApiServices();
  });

  
}
