import 'package:test/loyalty/loyalty_utils.dart';

/// This file contains the CustomerLoyaltyPoints extension
extension type CustomerLoyaltyPoints(int points) {
  /// Returns the rank of the customer based on the points
  String getRank() {
    final MapEntry<String, int> currentRank = customerRanks.entries.firstWhere(
      (MapEntry<String, int> element) => points < element.value,
      orElse: () => customerRanks.entries.first,
    );

    return currentRank.key;
  }

  /// Returns the points required to reach the next rank
  /// If the customer is already at the highest rank, it returns 0
  int getPointsToNextRank() {
    final MapEntry<String, int> currentRank = customerRanks.entries.firstWhere(
      (MapEntry<String, int> element) => points < element.value,
      orElse: () => customerRanks.entries.last,
    );

    if (currentRank.key == customerRanks.keys.last) {
      return 0;
    }

    return currentRank.value - points;
  }

  /// Converts the **List<dynamic>** representation of the points from the API to an [CustomerLoyaltyPoints]
  /// With this function we know it's safe to use **first** on the list
  static CustomerLoyaltyPoints fromApi(List<dynamic> apiRep) {
    if (apiRep.isEmpty || apiRep.first == null) {
      return CustomerLoyaltyPoints(0);
    }

    if (apiRep.first is String) {
      return CustomerLoyaltyPoints(int.tryParse(apiRep.first) ?? 0);
    } else {
      return CustomerLoyaltyPoints(apiRep.first);
    }
  }

  /// When the customer give point to another customer
  CustomerLoyaltyPoints operator +(CustomerLoyaltyPoints other) =>
      CustomerLoyaltyPoints(
        points + other.points,
      );
}
