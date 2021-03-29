// GENERATED CODE - DO NOT MODIFY BY HAND

part of approved_food;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApprovedFood> _$approvedFoodSerializer =
    new _$ApprovedFoodSerializer();

class _$ApprovedFoodSerializer implements StructuredSerializer<ApprovedFood> {
  @override
  final Iterable<Type> types = const [ApprovedFood, _$ApprovedFood];
  @override
  final String wireName = 'ApprovedFood';

  @override
  Iterable<Object> serialize(Serializers serializers, ApprovedFood object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Categories)])));
    }
    return result;
  }

  @override
  ApprovedFood deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApprovedFoodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Categories)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ApprovedFood extends ApprovedFood {
  @override
  final BuiltList<Categories> categories;

  factory _$ApprovedFood([void Function(ApprovedFoodBuilder) updates]) =>
      (new ApprovedFoodBuilder()..update(updates)).build();

  _$ApprovedFood._({this.categories}) : super._();

  @override
  ApprovedFood rebuild(void Function(ApprovedFoodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApprovedFoodBuilder toBuilder() => new ApprovedFoodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApprovedFood && categories == other.categories;
  }

  @override
  int get hashCode {
    return $jf($jc(0, categories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApprovedFood')
          ..add('categories', categories))
        .toString();
  }
}

class ApprovedFoodBuilder
    implements Builder<ApprovedFood, ApprovedFoodBuilder> {
  _$ApprovedFood _$v;

  ListBuilder<Categories> _categories;
  ListBuilder<Categories> get categories =>
      _$this._categories ??= new ListBuilder<Categories>();
  set categories(ListBuilder<Categories> categories) =>
      _$this._categories = categories;

  ApprovedFoodBuilder();

  ApprovedFoodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categories = $v.categories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApprovedFood other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApprovedFood;
  }

  @override
  void update(void Function(ApprovedFoodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApprovedFood build() {
    _$ApprovedFood _$result;
    try {
      _$result = _$v ?? new _$ApprovedFood._(categories: _categories?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ApprovedFood', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
