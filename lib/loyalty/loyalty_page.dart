import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test/loyalty/customer_loyalty_points.dart';
import 'package:test/loyalty/loyalty_point_api_service.dart';

/// The page that shows the loyalty points of the customer.
class LoyaltyPage extends StatefulWidget {
  /// Constructs a [LoyaltyPage] instance.
  const LoyaltyPage({super.key});

  @override
  State<LoyaltyPage> createState() => _LoyaltyPageState();
}

class _LoyaltyPageState extends State<LoyaltyPage> {
  final int _pointToAdd = 100;

  bool _isLoading = true;

  late CustomerLoyaltyPoints _points;

  @override
  void initState() {
    super.initState();
    unawaited(_onInit());
  }

  Future<void> _onInit() async {
    _points = await LoyaltyPointApiService.fetchLoyaltyPoints();

    setState(() {
      _isLoading = false;
    });
  }

  void _onGivePoints() {
    setState(() {
      _points += CustomerLoyaltyPoints(_pointToAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loyalty Page'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Loyalty Points: $_points'),
                  Text('Rank: ${_points.getRank()}'),
                  Text('Points to next rank: ${_points.getPointsToNextRank()}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _onGivePoints,
                    child: Text('Add $_pointToAdd points'),
                  ),
                ],
              ),
            ),
    );
  }
}
