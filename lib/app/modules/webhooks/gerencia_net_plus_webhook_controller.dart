import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'gerencia_net_plus_webhook_controller.g.dart';

class GerenciaNetPlusWebhookController {
  @Route.post('/webhook')
  Future<Response> webhookConfig(Request request) async {
    return Response(
      200,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  @Route.post('/webhook/pix')
  Future<Response> webhookPaymentCallback(Request request) async {
    final callback = await request.readAsString();

    print(callback);

    return Response(
      200,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Router get router => _$GerenciaNetPlusWebhookControllerRouter(this);
}
