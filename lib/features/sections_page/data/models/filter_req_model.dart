class FilterReqModel {
  final String? q;
  final List<String>? propertyType;
  final List<String>? offerType;
  final String? city;
  final num? minPrice;
  final num? maxPrice;
  final String? currency;
  final num? minArea;
  final num? maxArea;
  final String? sortBy;
  final int? featuredOnly;
  final String? token;

  FilterReqModel({
    this.q,
    this.propertyType,
    this.offerType,
    this.city,
    this.minPrice,
    this.maxPrice,
    this.currency,
    this.minArea,
    this.maxArea,
    this.sortBy,
    this.featuredOnly,
    this.token,
  });

  static const List<String> defaultPropertyType = [];
  static const List<String> defaultOfferType = [];
  static const String defaultSortBy = 'newest';
  static const int defaultFeaturedOnly = 0;

  String toQueryParams() {
    final params = <String>[];

    if (q != null && q!.isNotEmpty) {
      params.add('q=${Uri.encodeComponent(q!)}');
    }

    if (propertyType != null && propertyType!.isNotEmpty) {
      params.add(
        'property_type=${Uri.encodeComponent(propertyType!.join(','))}',
      );
    } else if (propertyType == null) {
    }

    if (offerType != null && offerType!.isNotEmpty) {
      params.add('offer_type=${Uri.encodeComponent(offerType!.join(','))}');
    }

    if (city != null && city!.isNotEmpty) {
      params.add('city=${Uri.encodeComponent(city!)}');
    }

    final minPriceValue = minPrice ?? 0;
    params.add('min_price=$minPriceValue');

    final maxPriceValue = maxPrice ?? 1000000;
    params.add('max_price=$maxPriceValue');

    if (currency != null && currency!.isNotEmpty) {
      params.add('currency=${Uri.encodeComponent(currency!)}');
    }

    final minAreaValue = minArea ?? 0;
    params.add('min_area=$minAreaValue');

    final maxAreaValue = maxArea ?? 10000;
    params.add('max_area=$maxAreaValue');

    final sortByValue = sortBy ?? defaultSortBy;
    params.add('sort_by=${Uri.encodeComponent(sortByValue)}');

    final featuredOnlyValue = featuredOnly ?? defaultFeaturedOnly;
    params.add('featured_only=$featuredOnlyValue');

    return params.join('&');
  }

  FilterReqModel copyWith({
    String? q,
    List<String>? propertyType,
    List<String>? offerType,
    String? city,
    num? minPrice,
    num? maxPrice,
    String? currency,
    num? minArea,
    num? maxArea,
    String? sortBy,
    int? featuredOnly,
    String? token,
  }) {
    return FilterReqModel(
      q: q ?? this.q,
      propertyType: propertyType ?? this.propertyType,
      offerType: offerType ?? this.offerType,
      city: city ?? this.city,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      currency: currency ?? this.currency,
      minArea: minArea ?? this.minArea,
      maxArea: maxArea ?? this.maxArea,
      sortBy: sortBy ?? this.sortBy,
      featuredOnly: featuredOnly ?? this.featuredOnly,
      token: token ?? this.token,
    );
  }
}
