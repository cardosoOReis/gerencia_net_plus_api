import 'dart:io';

import 'package:gerencia_net_plus_api/app/modules/hello_world/hello_world_controller.dart';
import 'package:gerencia_net_plus_api/app/modules/webhooks/gerencia_net_plus_webhook_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..mount('/', HelloWorldController().router)
  ..mount('/gerencianet/webhook/', GerenciaNetPlusWebhookController().router);

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
