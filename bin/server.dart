import 'dart:io';

Future<void> main() async {
  final server =
      await HttpServer.bind(InternetAddress.loopbackIPv4, 8080, shared: true);
  listenForServerResponse(server);
}

listenForServerResponse(HttpServer server) {
  server.listen((HttpRequest request) async {
    final uri = request.uri;
    request.response
      ..statusCode = 200
      ..headers.set("content-type", ContentType.HTML.mimeType);

    final code = uri.queryParameters["code"];
    final error = uri.queryParameters["error"];
    await request.response.close();
    if (code != null) {
      print(code);
    } else if (error != null) {
      print(error);
    }
  });
}
