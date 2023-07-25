import 'dart:async';
import 'package:gerencia_net_plus_api/app/modules/webhooks/view_models/gerencia_net_plus_callback_view_model.dart';
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
    final callback = GerenciaNetPlusCallbackViewModel.fromJson(
      await request.readAsString(),
    );

    print(callback.toMap());

    return Response(
      200,
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Router get router => _$GerenciaNetPlusWebhookControllerRouter(this);
}
