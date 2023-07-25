// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gerencia_net_plus_webhook_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$GerenciaNetPlusWebhookControllerRouter(
    GerenciaNetPlusWebhookController service) {
  final router = Router();
  router.add(
    'POST',
    r'/',
    service.webhookConfig,
  );
  router.add(
    'POST',
    r'/pix',
    service.webhookPaymentCallback,
  );
  return router;
}
