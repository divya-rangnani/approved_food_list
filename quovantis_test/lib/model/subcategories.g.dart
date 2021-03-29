// GENERATED CODE - DO NOT MODIFY BY HAND

part of subcategories;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Subcategories> _$subcategoriesSerializer =
    new _$SubcategoriesSerializer();

class _$SubcategoriesSerializer implements StructuredSerializer<Subcategories> {
  @override
  final Iterable<Type> types = const [Subcategories, _$Subcategories];
  @override
  final String wireName = 'Subcategories';

  @override
  Iterable<Object> serialize(Serializers serializers, Subcategories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.items;
    if (value != null) {
      result
        ..add('items')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.subCategoryname;
    if (value != null) {
      result
        ..add('subCategoryname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.colorCode;
    if (value != null) {
      result
        ..add('colorCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Subcategories deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubcategoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'subCategoryname':
          result.subCategoryname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'colorCode':
          result.colorCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Subcategories extends Subcategories {
  @override
  final BuiltList<String> items;
  @override
  final String subCategoryname;
  @override
  final String colorCode;

  factory _$Subcategories([void Function(SubcategoriesBuilder) updates]) =>
      (new SubcategoriesBuilder()..update(updates)).build();

  _$Subcategories._({this.items, this.subCategoryname, this.colorCode})
      : super._();

  @override
  Subcategories rebuild(void Function(SubcategoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubcategoriesBuilder toBuilder() => new SubcategoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subcategories &&
        items == other.items &&
        subCategoryname == other.subCategoryname &&
        colorCode == other.colorCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, items.hashCode), subCategoryname.hashCode),
        colorCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subcategories')
          ..add('items', items)
          ..add('subCategoryname', subCategoryname)
          ..add('colorCode', colorCode))
        .toString();
  }
}

class SubcategoriesBuilder
    implements Builder<Subcategories, SubcategoriesBuilder> {
  _$Subcategories _$v;

  ListBuilder<String> _items;
  ListBuilder<String> get items => _$this._items ??= new ListBuilder<String>();
  set items(ListBuilder<String> items) => _$this._items = items;

  String _subCategoryname;
  String get subCategoryname => _$this._subCategoryname;
  set subCategoryname(String subCategoryname) =>
      _$this._subCategoryname = subCategoryname;

  String _colorCode;
  String get colorCode => _$this._colorCode;
  set colorCode(String colorCode) => _$this._colorCode = colorCode;

  SubcategoriesBuilder();

  SubcategoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items?.toBuilder();
      _subCategoryname = $v.subCategoryname;
      _colorCode = $v.colorCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subcategories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Subcategories;
  }

  @override
  void update(void Function(SubcategoriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Subcategories build() {
    _$Subcategories _$result;
    try {
      _$result = _$v ??
          new _$Subcategories._(
              items: _items?.build(),
              subCategoryname: subCategoryname,
              colorCode: colorCode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Subcategories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
