// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utxo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Utxo _$UtxoFromJson(Map<String, dynamic> json) {
  return _Utxo.fromJson(json);
}

/// @nodoc
mixin _$Utxo {
  String get txid => throw _privateConstructorUsedError;
  int get vout => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get confirmations => throw _privateConstructorUsedError;

  /// Serializes this Utxo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Utxo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UtxoCopyWith<Utxo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UtxoCopyWith<$Res> {
  factory $UtxoCopyWith(Utxo value, $Res Function(Utxo) then) =
      _$UtxoCopyWithImpl<$Res, Utxo>;
  @useResult
  $Res call(
      {String txid, int vout, String value, int height, int confirmations});
}

/// @nodoc
class _$UtxoCopyWithImpl<$Res, $Val extends Utxo>
    implements $UtxoCopyWith<$Res> {
  _$UtxoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Utxo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
    Object? value = null,
    Object? height = null,
    Object? confirmations = null,
  }) {
    return _then(_value.copyWith(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UtxoImplCopyWith<$Res> implements $UtxoCopyWith<$Res> {
  factory _$$UtxoImplCopyWith(
          _$UtxoImpl value, $Res Function(_$UtxoImpl) then) =
      __$$UtxoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String txid, int vout, String value, int height, int confirmations});
}

/// @nodoc
class __$$UtxoImplCopyWithImpl<$Res>
    extends _$UtxoCopyWithImpl<$Res, _$UtxoImpl>
    implements _$$UtxoImplCopyWith<$Res> {
  __$$UtxoImplCopyWithImpl(_$UtxoImpl _value, $Res Function(_$UtxoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Utxo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txid = null,
    Object? vout = null,
    Object? value = null,
    Object? height = null,
    Object? confirmations = null,
  }) {
    return _then(_$UtxoImpl(
      txid: null == txid
          ? _value.txid
          : txid // ignore: cast_nullable_to_non_nullable
              as String,
      vout: null == vout
          ? _value.vout
          : vout // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UtxoImpl extends _Utxo {
  const _$UtxoImpl(
      {this.txid = '',
      this.vout = 0,
      this.value = '',
      this.height = 0,
      this.confirmations = 0})
      : super._();

  factory _$UtxoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UtxoImplFromJson(json);

  @override
  @JsonKey()
  final String txid;
  @override
  @JsonKey()
  final int vout;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final int confirmations;

  @override
  String toString() {
    return 'Utxo(txid: $txid, vout: $vout, value: $value, height: $height, confirmations: $confirmations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UtxoImpl &&
            (identical(other.txid, txid) || other.txid == txid) &&
            (identical(other.vout, vout) || other.vout == vout) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.confirmations, confirmations) ||
                other.confirmations == confirmations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, txid, vout, value, height, confirmations);

  /// Create a copy of Utxo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UtxoImplCopyWith<_$UtxoImpl> get copyWith =>
      __$$UtxoImplCopyWithImpl<_$UtxoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UtxoImplToJson(
      this,
    );
  }
}

abstract class _Utxo extends Utxo {
  const factory _Utxo(
      {final String txid,
      final int vout,
      final String value,
      final int height,
      final int confirmations}) = _$UtxoImpl;
  const _Utxo._() : super._();

  factory _Utxo.fromJson(Map<String, dynamic> json) = _$UtxoImpl.fromJson;

  @override
  String get txid;
  @override
  int get vout;
  @override
  String get value;
  @override
  int get height;
  @override
  int get confirmations;

  /// Create a copy of Utxo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UtxoImplCopyWith<_$UtxoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
