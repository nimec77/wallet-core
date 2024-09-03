// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bitcoin_address_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BitcoinAddressInfo _$BitcoinAddressInfoFromJson(Map<String, dynamic> json) {
  return _BitcoinAddressInfo.fromJson(json);
}

/// @nodoc
mixin _$BitcoinAddressInfo {
  int? get page => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get itemsOnPage => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get balance => throw _privateConstructorUsedError;
  String? get totalReceived => throw _privateConstructorUsedError;
  String? get totalSent => throw _privateConstructorUsedError;
  String? get unconfirmedBalance => throw _privateConstructorUsedError;
  int? get unconfirmedTxs => throw _privateConstructorUsedError;
  int? get txs => throw _privateConstructorUsedError;
  List<String>? get txids => throw _privateConstructorUsedError;

  /// Serializes this BitcoinAddressInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BitcoinAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BitcoinAddressInfoCopyWith<BitcoinAddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BitcoinAddressInfoCopyWith<$Res> {
  factory $BitcoinAddressInfoCopyWith(
          BitcoinAddressInfo value, $Res Function(BitcoinAddressInfo) then) =
      _$BitcoinAddressInfoCopyWithImpl<$Res, BitcoinAddressInfo>;
  @useResult
  $Res call(
      {int? page,
      int? totalPages,
      int? itemsOnPage,
      String? address,
      String? balance,
      String? totalReceived,
      String? totalSent,
      String? unconfirmedBalance,
      int? unconfirmedTxs,
      int? txs,
      List<String>? txids});
}

/// @nodoc
class _$BitcoinAddressInfoCopyWithImpl<$Res, $Val extends BitcoinAddressInfo>
    implements $BitcoinAddressInfoCopyWith<$Res> {
  _$BitcoinAddressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BitcoinAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? totalPages = freezed,
    Object? itemsOnPage = freezed,
    Object? address = freezed,
    Object? balance = freezed,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? unconfirmedBalance = freezed,
    Object? unconfirmedTxs = freezed,
    Object? txs = freezed,
    Object? txids = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsOnPage: freezed == itemsOnPage
          ? _value.itemsOnPage
          : itemsOnPage // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSent: freezed == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as String?,
      unconfirmedBalance: freezed == unconfirmedBalance
          ? _value.unconfirmedBalance
          : unconfirmedBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      unconfirmedTxs: freezed == unconfirmedTxs
          ? _value.unconfirmedTxs
          : unconfirmedTxs // ignore: cast_nullable_to_non_nullable
              as int?,
      txs: freezed == txs
          ? _value.txs
          : txs // ignore: cast_nullable_to_non_nullable
              as int?,
      txids: freezed == txids
          ? _value.txids
          : txids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BitcoinAddressInfoImplCopyWith<$Res>
    implements $BitcoinAddressInfoCopyWith<$Res> {
  factory _$$BitcoinAddressInfoImplCopyWith(_$BitcoinAddressInfoImpl value,
          $Res Function(_$BitcoinAddressInfoImpl) then) =
      __$$BitcoinAddressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      int? totalPages,
      int? itemsOnPage,
      String? address,
      String? balance,
      String? totalReceived,
      String? totalSent,
      String? unconfirmedBalance,
      int? unconfirmedTxs,
      int? txs,
      List<String>? txids});
}

/// @nodoc
class __$$BitcoinAddressInfoImplCopyWithImpl<$Res>
    extends _$BitcoinAddressInfoCopyWithImpl<$Res, _$BitcoinAddressInfoImpl>
    implements _$$BitcoinAddressInfoImplCopyWith<$Res> {
  __$$BitcoinAddressInfoImplCopyWithImpl(_$BitcoinAddressInfoImpl _value,
      $Res Function(_$BitcoinAddressInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BitcoinAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? totalPages = freezed,
    Object? itemsOnPage = freezed,
    Object? address = freezed,
    Object? balance = freezed,
    Object? totalReceived = freezed,
    Object? totalSent = freezed,
    Object? unconfirmedBalance = freezed,
    Object? unconfirmedTxs = freezed,
    Object? txs = freezed,
    Object? txids = freezed,
  }) {
    return _then(_$BitcoinAddressInfoImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsOnPage: freezed == itemsOnPage
          ? _value.itemsOnPage
          : itemsOnPage // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalReceived: freezed == totalReceived
          ? _value.totalReceived
          : totalReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSent: freezed == totalSent
          ? _value.totalSent
          : totalSent // ignore: cast_nullable_to_non_nullable
              as String?,
      unconfirmedBalance: freezed == unconfirmedBalance
          ? _value.unconfirmedBalance
          : unconfirmedBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      unconfirmedTxs: freezed == unconfirmedTxs
          ? _value.unconfirmedTxs
          : unconfirmedTxs // ignore: cast_nullable_to_non_nullable
              as int?,
      txs: freezed == txs
          ? _value.txs
          : txs // ignore: cast_nullable_to_non_nullable
              as int?,
      txids: freezed == txids
          ? _value._txids
          : txids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BitcoinAddressInfoImpl implements _BitcoinAddressInfo {
  const _$BitcoinAddressInfoImpl(
      {this.page,
      this.totalPages,
      this.itemsOnPage,
      this.address,
      this.balance,
      this.totalReceived,
      this.totalSent,
      this.unconfirmedBalance,
      this.unconfirmedTxs,
      this.txs,
      final List<String>? txids})
      : _txids = txids;

  factory _$BitcoinAddressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BitcoinAddressInfoImplFromJson(json);

  @override
  final int? page;
  @override
  final int? totalPages;
  @override
  final int? itemsOnPage;
  @override
  final String? address;
  @override
  final String? balance;
  @override
  final String? totalReceived;
  @override
  final String? totalSent;
  @override
  final String? unconfirmedBalance;
  @override
  final int? unconfirmedTxs;
  @override
  final int? txs;
  final List<String>? _txids;
  @override
  List<String>? get txids {
    final value = _txids;
    if (value == null) return null;
    if (_txids is EqualUnmodifiableListView) return _txids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BitcoinAddressInfo(page: $page, totalPages: $totalPages, itemsOnPage: $itemsOnPage, address: $address, balance: $balance, totalReceived: $totalReceived, totalSent: $totalSent, unconfirmedBalance: $unconfirmedBalance, unconfirmedTxs: $unconfirmedTxs, txs: $txs, txids: $txids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BitcoinAddressInfoImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.itemsOnPage, itemsOnPage) ||
                other.itemsOnPage == itemsOnPage) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.totalReceived, totalReceived) ||
                other.totalReceived == totalReceived) &&
            (identical(other.totalSent, totalSent) ||
                other.totalSent == totalSent) &&
            (identical(other.unconfirmedBalance, unconfirmedBalance) ||
                other.unconfirmedBalance == unconfirmedBalance) &&
            (identical(other.unconfirmedTxs, unconfirmedTxs) ||
                other.unconfirmedTxs == unconfirmedTxs) &&
            (identical(other.txs, txs) || other.txs == txs) &&
            const DeepCollectionEquality().equals(other._txids, _txids));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      totalPages,
      itemsOnPage,
      address,
      balance,
      totalReceived,
      totalSent,
      unconfirmedBalance,
      unconfirmedTxs,
      txs,
      const DeepCollectionEquality().hash(_txids));

  /// Create a copy of BitcoinAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BitcoinAddressInfoImplCopyWith<_$BitcoinAddressInfoImpl> get copyWith =>
      __$$BitcoinAddressInfoImplCopyWithImpl<_$BitcoinAddressInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BitcoinAddressInfoImplToJson(
      this,
    );
  }
}

abstract class _BitcoinAddressInfo implements BitcoinAddressInfo {
  const factory _BitcoinAddressInfo(
      {final int? page,
      final int? totalPages,
      final int? itemsOnPage,
      final String? address,
      final String? balance,
      final String? totalReceived,
      final String? totalSent,
      final String? unconfirmedBalance,
      final int? unconfirmedTxs,
      final int? txs,
      final List<String>? txids}) = _$BitcoinAddressInfoImpl;

  factory _BitcoinAddressInfo.fromJson(Map<String, dynamic> json) =
      _$BitcoinAddressInfoImpl.fromJson;

  @override
  int? get page;
  @override
  int? get totalPages;
  @override
  int? get itemsOnPage;
  @override
  String? get address;
  @override
  String? get balance;
  @override
  String? get totalReceived;
  @override
  String? get totalSent;
  @override
  String? get unconfirmedBalance;
  @override
  int? get unconfirmedTxs;
  @override
  int? get txs;
  @override
  List<String>? get txids;

  /// Create a copy of BitcoinAddressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BitcoinAddressInfoImplCopyWith<_$BitcoinAddressInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
