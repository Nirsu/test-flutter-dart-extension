import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/loyalty/loyalty_page.dart';

/// The HTTP client used to make requests.
final http.Client client = http.Client();

void main() {
  runApp(const Main());
}

/// This is the main application widget.
class Main extends StatelessWidget {
  /// The const constructor makes this class immutable.
  const Main({super.key});

  final String _title = 'Flutter Epitech';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Builder(
        builder: (_) {
          return _Home(title: _title);
        },
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello, World!'),
            ElevatedButton(
              onPressed: () => unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const LoyaltyPage(),
                  ),
                ),
              ),
              child: const Text('Go to Loyalty Page'),
            ),
          ],
        ),
      ),
    );
  }
}
