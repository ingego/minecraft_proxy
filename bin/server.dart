import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.anyIPv6, 19133);
  print('Proxy server listening on port ${server.port}');
  await for (var request in server) {
    // Обрабатывайте запросы здесь
//     var targetUri = Uri.parse('https://www.google.com/');

// var client = http.Client();
// var targetRequest = http.Request(request.method, targetUri);
// targetRequest.bodyBytes = (await request.toList());

// var targetResponse = await client.send(targetRequest);
// response.statusCode = targetResponse.statusCode;
// response.headers.addAll(targetResponse.headers);

// await targetResponse.stream.pipe(response);

  }
}
