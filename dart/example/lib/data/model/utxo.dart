import 'package:freezed_annotation/freezed_annotation.dart';

part 'utxo.freezed.dart';
part 'utxo.g.dart';

@freezed
class Utxo with _$Utxo {
  const Utxo._();

  const factory Utxo({
    @Default('') String txid,
    @Default(0) int vout,
    @Default('') String value,
    @Default(0) int height,
    @Default(0) int confirmations,
  }) = _Utxo;

  factory Utxo.fromJson(Map<String, dynamic> json) => _$UtxoFromJson(json);
}
