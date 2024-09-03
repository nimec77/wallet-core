// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utxo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtxoImpl _$$UtxoImplFromJson(Map<String, dynamic> json) => _$UtxoImpl(
      txid: json['txid'] as String? ?? '',
      vout: (json['vout'] as num?)?.toInt() ?? 0,
      value: json['value'] as String? ?? '',
      height: (json['height'] as num?)?.toInt() ?? 0,
      confirmations: (json['confirmations'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UtxoImplToJson(_$UtxoImpl instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'vout': instance.vout,
      'value': instance.value,
      'height': instance.height,
      'confirmations': instance.confirmations,
    };
