import 'dart:convert';

class GerenciaNetPlusPixViewModel {
  final String endToEndId;
  final String txid;
  final String pixKey;
  final double value;
  final DateTime transactionTime;
  GerenciaNetPlusPixViewModel({
    required this.endToEndId,
    required this.txid,
    required this.pixKey,
    required this.value,
    required this.transactionTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'endToEndId': endToEndId,
      'txid': txid,
      'pixKey': pixKey,
      'value': value,
      'transactionTime': transactionTime.millisecondsSinceEpoch,
    };
  }

  factory GerenciaNetPlusPixViewModel.fromMap(Map<String, dynamic> map) {
    return GerenciaNetPlusPixViewModel(
      endToEndId: map['endToEndId'] as String,
      txid: map['txid'] as String,
      pixKey: map['chave'] as String,
      value: double.parse(map['valor']),
      transactionTime: DateTime.parse(map['horario']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GerenciaNetPlusPixViewModel.fromJson(String source) =>
      GerenciaNetPlusPixViewModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
