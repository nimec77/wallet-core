// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bitcoin_address_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BitcoinAddressInfoImpl _$$BitcoinAddressInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$BitcoinAddressInfoImpl(
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      itemsOnPage: (json['itemsOnPage'] as num?)?.toInt(),
      address: json['address'] as String?,
      balance: json['balance'] as String?,
      totalReceived: json['totalReceived'] as String?,
      totalSent: json['totalSent'] as String?,
      unconfirmedBalance: json['unconfirmedBalance'] as String?,
      unconfirmedTxs: (json['unconfirmedTxs'] as num?)?.toInt(),
      txs: (json['txs'] as num?)?.toInt(),
      txids:
          (json['txids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$BitcoinAddressInfoImplToJson(
        _$BitcoinAddressInfoImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalPages': instance.totalPages,
      'itemsOnPage': instance.itemsOnPage,
      'address': instance.address,
      'balance': instance.balance,
      'totalReceived': instance.totalReceived,
      'totalSent': instance.totalSent,
      'unconfirmedBalance': instance.unconfirmedBalance,
      'unconfirmedTxs': instance.unconfirmedTxs,
      'txs': instance.txs,
      'txids': instance.txids,
    };
