import 'dart:convert';

import 'package:gerencia_net_plus_api/app/modules/webhooks/view_models/gerencia_net_plus_pix_view_model.dart';

class GerenciaNetPlusCallbackViewModel {
  final List<GerenciaNetPlusPixViewModel> pix;
  const GerenciaNetPlusCallbackViewModel({
    required this.pix,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pix': pix.map((x) => x.toMap()).toList(),
    };
  }

  factory GerenciaNetPlusCallbackViewModel.fromMap(Map<String, dynamic> map) {
    return GerenciaNetPlusCallbackViewModel(
      pix: List<GerenciaNetPlusPixViewModel>.from(
        (map['pix'] as List<dynamic>).map<GerenciaNetPlusPixViewModel>(
          (x) => GerenciaNetPlusPixViewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GerenciaNetPlusCallbackViewModel.fromJson(String source) =>
      GerenciaNetPlusCallbackViewModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
