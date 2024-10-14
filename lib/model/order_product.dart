import '../service/basic_functions.dart';
import 'product_details.dart';
import 'user_details.dart';

class OrderwidgetModel {
  int? id;
  int? parentId;
  String? status;
  String? currency;
  String? version;
  bool? pricesIncludeTax;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? cartTax;
  String? total;
  String? totalTax;
  int? customerId;
  String? orderKey;
  Billing? billing;
  Shipping? shipping;
  String? paymentMethod;
  String? paymentMethodTitle;
  String? transactionId;
  String? customerIpAddress;
  String? customerUserAgent;
  String? createdVia;
  String? customerNote;
  DateTime? dateCompleted;
  DateTime? datePaid;
  String? cartHash;
  String? number;
  List<MetaData>? metaData;
  List<LineItems>? lineItems;
  List<ShippingLines>? shippingLines;
  String? paymentUrl;
  bool? isEditable;
  bool? needsPayment;
  bool? needsProcessing;
  DateTime? dateCreatedGmt;
  DateTime? dateModifiedGmt;
  DateTime? dateCompletedGmt;
  DateTime? datePaidGmt;
  String? currencySymbol;
  Links? lLinks;

  OrderwidgetModel(
      {this.id,
      this.parentId,
      this.status,
      this.currency,
      this.version,
      this.pricesIncludeTax,
      this.dateCreated,
      this.dateModified,
      this.discountTotal,
      this.discountTax,
      this.shippingTotal,
      this.shippingTax,
      this.cartTax,
      this.total,
      this.totalTax,
      this.customerId,
      this.orderKey,
      this.billing,
      this.shipping,
      this.paymentMethod,
      this.paymentMethodTitle,
      this.transactionId,
      this.customerIpAddress,
      this.customerUserAgent,
      this.createdVia,
      this.customerNote,
      this.dateCompleted,
      this.datePaid,
      this.cartHash,
      this.number,
      this.metaData,
      this.lineItems,
      this.shippingLines,
      this.paymentUrl,
      this.isEditable,
      this.needsPayment,
      this.needsProcessing,
      this.dateCreatedGmt,
      this.dateModifiedGmt,
      this.dateCompletedGmt,
      this.datePaidGmt,
      this.currencySymbol,
      this.lLinks});

  OrderwidgetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    status = json['status'];
    currency = json['currency'];
    version = json['version'];
    pricesIncludeTax = json['prices_include_tax'];
    dateCreated = parceformateDate(json['date_created']);
    dateModified = parceformateDate(json['date_modified']);
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    cartTax = json['cart_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    customerId = json['customer_id'];
    orderKey = json['order_key'];
    billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    transactionId = json['transaction_id'];
    customerIpAddress = json['customer_ip_address'];
    customerUserAgent = json['customer_user_agent'];
    createdVia = json['created_via'];
    customerNote = json['customer_note'];
    dateCompleted = parceformateDate(json['date_completed']);
    datePaid = parceformateDate(json['date_paid']);
    cartHash = json['cart_hash'];
    number = json['number'];
    if (json['meta_data'] != null) {
      metaData = <MetaData>[];
      json['meta_data'].forEach((v) {
        metaData!.add(MetaData.fromJson(v));
      });
    }
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(LineItems.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      shippingLines = <ShippingLines>[];
      json['shipping_lines'].forEach((v) {
        shippingLines!.add(ShippingLines.fromJson(v));
      });
    }
    paymentUrl = json['payment_url'];
    isEditable = json['is_editable'];
    needsPayment = json['needs_payment'];
    needsProcessing = json['needs_processing'];
    dateCreatedGmt = parceformateDate(json['date_created_gmt']);
    dateModifiedGmt = parceformateDate(json['date_modified_gmt']);
    dateCompletedGmt = parceformateDate(json['date_completed_gmt']);
    datePaidGmt = parceformateDate(json['date_paid_gmt']);
    currencySymbol = json['currency_symbol'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['status'] = status;
    data['currency'] = currency;
    data['version'] = version;
    data['prices_include_tax'] = pricesIncludeTax;
    data['date_created'] = dateCreated;
    data['date_modified'] = dateModified;
    data['discount_total'] = discountTotal;
    data['discount_tax'] = discountTax;
    data['shipping_total'] = shippingTotal;
    data['shipping_tax'] = shippingTax;
    data['cart_tax'] = cartTax;
    data['total'] = total;
    data['total_tax'] = totalTax;
    data['customer_id'] = customerId;
    data['order_key'] = orderKey;
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    data['transaction_id'] = transactionId;
    data['customer_ip_address'] = customerIpAddress;
    data['customer_user_agent'] = customerUserAgent;
    data['created_via'] = createdVia;
    data['customer_note'] = customerNote;
    data['date_completed'] = dateCompleted;
    data['date_paid'] = datePaid;
    data['cart_hash'] = cartHash;
    data['number'] = number;
    if (metaData != null) {
      data['meta_data'] = metaData!.map((v) => v.toJson()).toList();
    }
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    if (shippingLines != null) {
      data['shipping_lines'] = shippingLines!.map((v) => v.toJson()).toList();
    }
    data['payment_url'] = paymentUrl;
    data['is_editable'] = isEditable;
    data['needs_payment'] = needsPayment;
    data['needs_processing'] = needsProcessing;
    data['date_created_gmt'] = dateCreatedGmt;
    data['date_modified_gmt'] = dateModifiedGmt;
    data['date_completed_gmt'] = dateCompletedGmt;
    data['date_paid_gmt'] = datePaidGmt;
    data['currency_symbol'] = currencySymbol;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class MetaData {
  int? id;
  String? key;
  String? value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class LineItems {
  int? id;
  String? name;
  int? productId;
  int? variationId;
  int? quantity;
  String? taxClass;
  String? subtotal;
  String? subtotalTax;
  String? total;
  String? totalTax;
  String? sku;
  int? price;
  Imagedata? image;
  Null? parentName;

  LineItems(
      {this.id,
      this.name,
      this.productId,
      this.variationId,
      this.quantity,
      this.taxClass,
      this.subtotal,
      this.subtotalTax,
      this.total,
      this.totalTax,
      this.sku,
      this.price,
      this.image,
      this.parentName});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    taxClass = json['tax_class'];
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    sku = json['sku'];
    price = json['price'];
    image = json['image'] != null ? Imagedata.fromJson(json['image']) : null;
    parentName = json['parent_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_id'] = productId;
    data['variation_id'] = variationId;
    data['quantity'] = quantity;
    data['tax_class'] = taxClass;
    data['subtotal'] = subtotal;
    data['subtotal_tax'] = subtotalTax;
    data['total'] = total;
    data['total_tax'] = totalTax;
    data['sku'] = sku;
    data['price'] = price;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['parent_name'] = parentName;
    return data;
  }
}

class Imagedata {
  String? id;
  String? src;

  Imagedata({this.id, this.src});

  Imagedata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['src'] = src;
    return data;
  }
}

class ShippingLines {
  int? id;
  String? methodTitle;
  String? methodId;
  String? instanceId;
  String? total;
  String? totalTax;

  ShippingLines(
      {this.id,
      this.methodTitle,
      this.methodId,
      this.instanceId,
      this.total,
      this.totalTax});

  ShippingLines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    methodTitle = json['method_title'];
    methodId = json['method_id'];
    instanceId = json['instance_id'];
    total = json['total'];
    totalTax = json['total_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['method_title'] = methodTitle;
    data['method_id'] = methodId;
    data['instance_id'] = instanceId;
    data['total'] = total;
    data['total_tax'] = totalTax;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  // List<Customer>? customer;

  Links({
    this.self,
    this.collection,
    //  this.customer
  });

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(Collection.fromJson(v));
      });
    }
    // if (json['customer'] != null) {
    //   customer = <Customer>[];
    //   json['customer'].forEach((v) {
    //     customer!.add(Customer.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    // if (customer != null) {
    //   data['customer'] = customer!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
