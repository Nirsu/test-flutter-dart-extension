extension type URL(String url) {
  URL operator &(URL path) => URL('$url&${path.url}');
}

void main() {
  final a = URL('https://example.com');
  final b = URL('https://example.com');

  print(a & b & a); // true
}
