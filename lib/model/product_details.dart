class ProductDetails {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? dateOnSaleFrom;
  String? dateOnSaleFromGmt;
  String? dateOnSaleTo;
  String? dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<Downloads>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  String? stockStatus;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<int>? relatedIds;
  List<int>? upsellIds;
  List<int>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Categories>? categories;
  List<Tags>? tags;
  List<Images>? images;
  List<Attributes>? attributes;
  List<DefaultAttributes>? defaultAttributes;
  List<int>? variations;
  List<int>? groupedProducts;
  int? menuOrder;
  // List<MetaData>? metaData;
  Links? lLinks;

  ProductDetails(
      {this.id,
      this.name,
      this.slug,
      this.permalink,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.type,
      this.status,
      this.featured,
      this.catalogVisibility,
      this.description,
      this.shortDescription,
      this.sku,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.dateOnSaleFrom,
      this.dateOnSaleFromGmt,
      this.dateOnSaleTo,
      this.dateOnSaleToGmt,
      this.priceHtml,
      this.onSale,
      this.purchasable,
      this.totalSales,
      this.virtual,
      this.downloadable,
      this.downloads,
      this.downloadLimit,
      this.downloadExpiry,
      this.externalUrl,
      this.buttonText,
      this.taxStatus,
      this.taxClass,
      this.manageStock,
      this.stockQuantity,
      this.stockStatus,
      this.backorders,
      this.backordersAllowed,
      this.backordered,
      this.soldIndividually,
      this.weight,
      this.dimensions,
      this.shippingRequired,
      this.shippingTaxable,
      this.shippingClass,
      this.shippingClassId,
      this.reviewsAllowed,
      this.averageRating,
      this.ratingCount,
      this.relatedIds,
      this.upsellIds,
      this.crossSellIds,
      this.parentId,
      this.purchaseNote,
      this.categories,
      this.tags,
      this.images,
      this.attributes,
      this.defaultAttributes,
      this.variations,
      this.groupedProducts,
      this.menuOrder,
      // this.metaData,
      this.lLinks});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
    permalink = json['permalink'] ?? "";
    dateCreated = json['date_created'] ?? "";
    dateCreatedGmt = json['date_created_gmt'] ?? "";
    dateModified = json['date_modified'] ?? "";
    dateModifiedGmt = json['date_modified_gmt'] ?? "";
    type = json['type'] ?? "";
    status = json['status'] ?? "";
    featured = json['featured'] ?? "";
    catalogVisibility = json['catalog_visibility'] ?? "";
    description = json['description'] ?? "";
    shortDescription = json['short_description'] ?? "";
    sku = json['sku'] ?? "";
    price = json['price'] ?? "";
    regularPrice = json['regular_price'] ?? "";
    salePrice = json['sale_price'] ?? "";
    dateOnSaleFrom = json['date_on_sale_from'] ?? "";
    dateOnSaleFromGmt = json['date_on_sale_from_gmt'] ?? "";
    dateOnSaleTo = json['date_on_sale_to'] ?? "";
    dateOnSaleToGmt = json['date_on_sale_to_gmt'] ?? "";
    priceHtml = json['price_html'] ?? "";
    onSale = json['on_sale'] ?? "";
    purchasable = json['purchasable'] ?? "";
    totalSales = json['total_sales'] ?? 0;
    virtual = json['virtual'] ?? "";
    downloadable = json['downloadable'] ?? "";
    if (json['downloads'] != null) {
      downloads = <Downloads>[];
      json['downloads'].forEach((v) {
        downloads!.add(Downloads.fromJson(v));
      });
    } else {
      downloads = <Downloads>[];
    }
    downloadLimit = json['download_limit'] ?? 0;
    downloadExpiry = json['download_expiry'] ?? 0;
    externalUrl = json['external_url'] ?? "";
    buttonText = json['button_text'] ?? "";
    taxStatus = json['tax_status'] ?? "";
    taxClass = json['tax_class'] ?? "";
    manageStock = json['manage_stock'] ?? "";
    stockQuantity = json['stock_quantity'] ?? 0;
    stockStatus = json['stock_status'] ?? "";
    backorders = json['backorders'] ?? "";
    backordersAllowed = json['backorders_allowed'] ?? "";
    backordered = json['backordered'] ?? "";
    soldIndividually = json['sold_individually'] ?? "";
    weight = json['weight'] ?? "";
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    shippingRequired = json['shipping_required'] ?? "";
    shippingTaxable = json['shipping_taxable'] ?? "";
    shippingClass = json['shipping_class'] ?? "";
    shippingClassId = json['shipping_class_id'] ?? 0;
    reviewsAllowed = json['reviews_allowed'] ?? "";
    averageRating = json['average_rating'] ?? "";
    ratingCount = json['rating_count'] ?? 0;
    relatedIds = json['related_ids'].cast<int>() ?? [];
    upsellIds = json['upsell_ids'].cast<int>() ?? [];
    crossSellIds = json['cross_sell_ids'].cast<int>() ?? [];
    parentId = json['parent_id'] ?? 0;
    purchaseNote = json['purchase_note'] ?? "";
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    } else {
      categories = <Categories>[];
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    } else {
      tags = <Tags>[];
    }

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    } else {
      images = <Images>[];
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    } else {
      attributes = <Attributes>[];
    }
    if (json['default_attributes'] != null) {
      defaultAttributes = <DefaultAttributes>[];
      json['default_attributes'].forEach((v) {
        defaultAttributes!.add(DefaultAttributes.fromJson(v));
      });
    } else {
      defaultAttributes = <DefaultAttributes>[];
    }
    variations = json['variations'].cast<int>() ?? [];
    groupedProducts = json['grouped_products'].cast<int>() ?? [];
    menuOrder = json['menu_order'] ?? 0;
    // if (json['meta_data'] != null) {
    //   metaData = <MetaData>[];
    //   json['meta_data'].forEach((v) {
    //     metaData!.add(MetaData.fromJson(v));
    //   });
    // }
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['permalink'] = permalink;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['type'] = type;
    data['status'] = status;
    data['featured'] = featured;
    data['catalog_visibility'] = catalogVisibility;
    data['description'] = description;
    data['short_description'] = shortDescription;
    data['sku'] = sku;
    data['price'] = price;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['date_on_sale_from'] = dateOnSaleFrom;
    data['date_on_sale_from_gmt'] = dateOnSaleFromGmt;
    data['date_on_sale_to'] = dateOnSaleTo;
    data['date_on_sale_to_gmt'] = dateOnSaleToGmt;
    data['price_html'] = priceHtml;
    data['on_sale'] = onSale;
    data['purchasable'] = purchasable;
    data['total_sales'] = totalSales;
    data['virtual'] = virtual;
    data['downloadable'] = downloadable;
    if (downloads != null) {
      data['downloads'] = downloads!.map((v) => v.toJson()).toList();
    }
    data['download_limit'] = downloadLimit;
    data['download_expiry'] = downloadExpiry;
    data['external_url'] = externalUrl;
    data['button_text'] = buttonText;
    data['tax_status'] = taxStatus;
    data['tax_class'] = taxClass;
    data['manage_stock'] = manageStock;
    data['stock_quantity'] = stockQuantity;
    data['stock_status'] = stockStatus;
    data['backorders'] = backorders;
    data['backorders_allowed'] = backordersAllowed;
    data['backordered'] = backordered;
    data['sold_individually'] = soldIndividually;
    data['weight'] = weight;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    data['shipping_required'] = shippingRequired;
    data['shipping_taxable'] = shippingTaxable;
    data['shipping_class'] = shippingClass;
    data['shipping_class_id'] = shippingClassId;
    data['reviews_allowed'] = reviewsAllowed;
    data['average_rating'] = averageRating;
    data['rating_count'] = ratingCount;
    data['related_ids'] = relatedIds;
    data['upsell_ids'] = upsellIds;
    data['cross_sell_ids'] = crossSellIds;
    data['parent_id'] = parentId;
    data['purchase_note'] = purchaseNote;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (defaultAttributes != null) {
      data['default_attributes'] =
          defaultAttributes!.map((v) => v.toJson()).toList();
    }
    data['variations'] = variations;
    data['grouped_products'] = groupedProducts;
    data['menu_order'] = menuOrder;
    // if (metaData != null) {
    //   data['meta_data'] = metaData!.map((v) => v.toJson()).toList();
    // }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Downloads {
  String? id;
  String? name;
  String? file;

  Downloads({this.id, this.name, this.file});

  Downloads.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    file = json['file'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['file'] = file;
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  Dimensions.fromJson(Map<String, dynamic> json) {
    length = json['length'] ?? "";
    width = json['width'] ?? "";
    height = json['height'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;

  Categories({this.id, this.name, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    slug = json['slug'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Images {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Images(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.src,
      this.name,
      this.alt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    dateCreated = json['date_created'] ?? "";
    dateCreatedGmt = json['date_created_gmt'] ?? "";
    dateModified = json['date_modified'] ?? "";
    dateModifiedGmt = json['date_modified_gmt'] ?? "";
    src = json['src'] ?? "";
    name = json['name'] ?? "";
    alt = json['alt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_created'] = dateCreated;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified'] = dateModified;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['src'] = src;
    data['name'] = name;
    data['alt'] = alt;
    return data;
  }
}

class Attributes {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? option;

  Attributes(
      {this.id,
      this.name,
      this.position,
      this.visible,
      this.variation,
      this.option});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    position = json['position'] ?? 0;
    visible = json['visible'] ?? "";
    variation = json['variation'] ?? "";
    option = json['option'].cast<String>() ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['visible'] = visible;
    data['variation'] = variation;
    data['option'] = option;
    return data;
  }
}

class DefaultAttributes {
  int? id;
  String? name;
  String? option;

  DefaultAttributes({this.id, this.name, this.option});

  DefaultAttributes.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    option = json['option'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['option'] = option;
    return data;
  }
}

class MetaData {
  int? id;
  String? key;
  String? value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    key = json['key'] ?? "";
    value = json['value'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({this.self, this.collection});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(Self.fromJson(v));
      });
    } else {
      self = <Self>[];
    }
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(Collection.fromJson(v));
      });
    } else {
      collection = <Collection>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? slug;

  Tags({this.id, this.name, this.slug});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    slug = json['slug'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
