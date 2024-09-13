import 'dart:typed_data';

import 'package:convert/convert.dart';

class Utils {
  static const _oneBtcInSatoshi = 100000000;

  const Utils._();

  static String bytesToHex(List<int> bytes) => hex.encode(Uint8List.fromList(bytes));

  static String btcToSatoshi(String btc) => (double.parse(btc) * _oneBtcInSatoshi).round().toString();

  static String satoshiToBtc(String satoshi) => (double.parse(satoshi) / _oneBtcInSatoshi).toString();
}
