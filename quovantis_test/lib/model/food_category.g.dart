// GENERATED CODE - DO NOT MODIFY BY HAND

part of food_category;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FoodCategory> _$foodCategorySerializer =
    new _$FoodCategorySerializer();

class _$FoodCategorySerializer implements StructuredSerializer<FoodCategory> {
  @override
  final Iterable<Type> types = const [FoodCategory, _$FoodCategory];
  @override
  final String wireName = 'FoodCategory';

  @override
  Iterable<Object> serialize(Serializers serializers, FoodCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.subcategories;
    if (value != null) {
      result
        ..add('subcategories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(Subcategories)])));
    }
    value = object.quote;
    if (value != null) {
      result
        ..add('quote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.protip;
    if (value != null) {
      result
        ..add('protip')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imagePath;
    if (value != null) {
      result
        ..add('imagePath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.localImagePath;
    if (value != null) {
      result
        ..add('localImagePath')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('categoryName')
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
    value = object.servingSize;
    if (value != null) {
      result
        ..add('servingSize')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isExpandable;
    if (value != null) {
      result
        ..add('isExpandable')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  FoodCategory deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FoodCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'subcategories':
          result.subcategories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Subcategories)]))
              as BuiltList<Object>);
          break;
        case 'quote':
          result.quote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'protip':
          result.protip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'localImagePath':
          result.localImagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryName':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'colorCode':
          result.colorCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'servingSize':
          result.servingSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isExpandable':
          result.isExpandable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$FoodCategory extends FoodCategory {
  @override
  final BuiltList<Subcategories> subcategories;
  @override
  final String quote;
  @override
  final String protip;
  @override
  final String imagePath;
  @override
  final String localImagePath;
  @override
  final String categoryName;
  @override
  final String colorCode;
  @override
  final String servingSize;
  @override
  final bool isExpandable;

  factory _$FoodCategory([void Function(FoodCategoryBuilder) updates]) =>
      (new FoodCategoryBuilder()..update(updates)).build();

  _$FoodCategory._(
      {this.subcategories,
      this.quote,
      this.protip,
      this.imagePath,
      this.localImagePath,
      this.categoryName,
      this.colorCode,
      this.servingSize,
      this.isExpandable})
      : super._();

  @override
  FoodCategory rebuild(void Function(FoodCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodCategoryBuilder toBuilder() => new FoodCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodCategory &&
        subcategories == other.subcategories &&
        quote == other.quote &&
        protip == other.protip &&
        imagePath == other.imagePath &&
        localImagePath == other.localImagePath &&
        categoryName == other.categoryName &&
        colorCode == other.colorCode &&
        servingSize == other.servingSize &&
        isExpandable == other.isExpandable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, subcategories.hashCode),
                                    quote.hashCode),
                                protip.hashCode),
                            imagePath.hashCode),
                        localImagePath.hashCode),
                    categoryName.hashCode),
                colorCode.hashCode),
            servingSize.hashCode),
        isExpandable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FoodCategory')
          ..add('subcategories', subcategories)
          ..add('quote', quote)
          ..add('protip', protip)
          ..add('imagePath', imagePath)
          ..add('localImagePath', localImagePath)
          ..add('categoryName', categoryName)
          ..add('colorCode', colorCode)
          ..add('servingSize', servingSize)
          ..add('isExpandable', isExpandable))
        .toString();
  }
}

class FoodCategoryBuilder
    implements Builder<FoodCategory, FoodCategoryBuilder> {
  _$FoodCategory _$v;

  ListBuilder<Subcategories> _subcategories;
  ListBuilder<Subcategories> get subcategories =>
      _$this._subcategories ??= new ListBuilder<Subcategories>();
  set subcategories(ListBuilder<Subcategories> subcategories) =>
      _$this._subcategories = subcategories;

  String _quote;
  String get quote => _$this._quote;
  set quote(String quote) => _$this._quote = quote;

  String _protip;
  String get protip => _$this._protip;
  set protip(String protip) => _$this._protip = protip;

  String _imagePath;
  String get imagePath => _$this._imagePath;
  set imagePath(String imagePath) => _$this._imagePath = imagePath;

  String _localImagePath;
  String get localImagePath => _$this._localImagePath;
  set localImagePath(String localImagePath) =>
      _$this._localImagePath = localImagePath;

  String _categoryName;
  String get categoryName => _$this._categoryName;
  set categoryName(String categoryName) => _$this._categoryName = categoryName;

  String _colorCode;
  String get colorCode => _$this._colorCode;
  set colorCode(String colorCode) => _$this._colorCode = colorCode;

  String _servingSize;
  String get servingSize => _$this._servingSize;
  set servingSize(String servingSize) => _$this._servingSize = servingSize;

  bool _isExpandable;
  bool get isExpandable => _$this._isExpandable;
  set isExpandable(bool isExpandable) => _$this._isExpandable = isExpandable;

  FoodCategoryBuilder();

  FoodCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subcategories = $v.subcategories?.toBuilder();
      _quote = $v.quote;
      _protip = $v.protip;
      _imagePath = $v.imagePath;
      _localImagePath = $v.localImagePath;
      _categoryName = $v.categoryName;
      _colorCode = $v.colorCode;
      _servingSize = $v.servingSize;
      _isExpandable = $v.isExpandable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FoodCategory;
  }

  @override
  void update(void Function(FoodCategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodCategory build() {
    _$FoodCategory _$result;
    try {
      _$result = _$v ??
          new _$FoodCategory._(
              subcategories: _subcategories?.build(),
              quote: quote,
              protip: protip,
              imagePath: imagePath,
              localImagePath: localImagePath,
              categoryName: categoryName,
              colorCode: colorCode,
              servingSize: servingSize,
              isExpandable: isExpandable);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subcategories';
        _subcategories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FoodCategory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
