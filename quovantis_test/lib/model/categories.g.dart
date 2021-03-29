// GENERATED CODE - DO NOT MODIFY BY HAND

part of categories;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Categories> _$categoriesSerializer = new _$CategoriesSerializer();

class _$CategoriesSerializer implements StructuredSerializer<Categories> {
  @override
  final Iterable<Type> types = const [Categories, _$Categories];
  @override
  final String wireName = 'Categories';

  @override
  Iterable<Object> serialize(Serializers serializers, Categories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(FoodCategory)));
    }
    return result;
  }

  @override
  Categories deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(FoodCategory)) as FoodCategory);
          break;
      }
    }

    return result.build();
  }
}

class _$Categories extends Categories {
  @override
  final FoodCategory category;

  factory _$Categories([void Function(CategoriesBuilder) updates]) =>
      (new CategoriesBuilder()..update(updates)).build();

  _$Categories._({this.category}) : super._();

  @override
  Categories rebuild(void Function(CategoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesBuilder toBuilder() => new CategoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Categories && category == other.category;
  }

  @override
  int get hashCode {
    return $jf($jc(0, category.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Categories')
          ..add('category', category))
        .toString();
  }
}

class CategoriesBuilder implements Builder<Categories, CategoriesBuilder> {
  _$Categories _$v;

  FoodCategoryBuilder _category;
  FoodCategoryBuilder get category =>
      _$this._category ??= new FoodCategoryBuilder();
  set category(FoodCategoryBuilder category) => _$this._category = category;

  CategoriesBuilder();

  CategoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Categories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Categories;
  }

  @override
  void update(void Function(CategoriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Categories build() {
    _$Categories _$result;
    try {
      _$result = _$v ?? new _$Categories._(category: _category?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Categories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
