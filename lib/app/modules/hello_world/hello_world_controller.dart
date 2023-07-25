import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'hello_world_controller.g.dart';

class HelloWorldController {
  @Route.get('/')
  Future<Response> find(Request request) async {
    return Response.ok(jsonEncode({'hello_world': 'Hello World'}));
  }

  Router get router => _$HelloWorldControllerRouter(this);
}
