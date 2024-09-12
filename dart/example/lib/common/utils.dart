import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:ffi/ffi.dart';

const _oneBtcInSatoshi = 100000000;

class Utils {
  Utils._();

  static Pointer<Char> toNativeChar(String string, {Allocator allocator = malloc}) {
    final units = utf8.encode(string);
    final Pointer<Uint8> result = allocator<Uint8>(units.length + 1);
    final Uint8List nativeString = result.asTypedList(units.length + 1);
    nativeString.setAll(0, units);
    nativeString[units.length] = 0;
    return result.cast<Char>();
  }

  static String bytesToHex(List<int> bytes) => hex.encode(Uint8List.fromList(bytes));

  static String btcToSatoshi(String btc) => (double.parse(btc) * _oneBtcInSatoshi).round().toString();

  static String satoshiToBtc(String satoshi) => (double.parse(satoshi) / _oneBtcInSatoshi).toString();
}
