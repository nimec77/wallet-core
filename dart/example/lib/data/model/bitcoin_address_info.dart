import 'package:freezed_annotation/freezed_annotation.dart';

part 'bitcoin_address_info.freezed.dart';
part 'bitcoin_address_info.g.dart';

@freezed
class BitcoinAddressInfo with _$BitcoinAddressInfo {
  const factory BitcoinAddressInfo({
    int? page,
    int? totalPages,
    int? itemsOnPage,
    String? address,
    String? balance,
    String? totalReceived,
    String? totalSent,
    String? unconfirmedBalance,
    int? unconfirmedTxs,
    int? txs,
    List<String>? txids,
  }) = _BitcoinAddressInfo;

  factory BitcoinAddressInfo.fromJson(Map<String, dynamic> json) => _$BitcoinAddressInfoFromJson(json);
}
