import 'dart:convert';

import 'package:http/http.dart';
import 'package:test/loyalty/customer_loyalty_points.dart';
import 'package:test/loyalty/loyalty_utils.dart';
import 'package:test/main.dart';

/// The API service used to make requests.
class LoyaltyPointApiService {
  static const String _baseUrl = 'http://www.randomnumberapi.com/api/v1.0';

  /// Fetches the loyalty points of the customer.
  static Future<CustomerLoyaltyPoints> fetchLoyaltyPoints() async {
    final int maxPoint = customerRanks.values.last;

    final Response rep = await client.get(
      Uri.parse('$_baseUrl/random?min=0&max=$maxPoint&count=1'),
    );

    return CustomerLoyaltyPoints.fromApi(jsonDecode(rep.body));
  }
}
