class ProductModel {
  int success;
  String message;
  List<Banner> banner1;
  List<dynamic> banner2;
  List<Banner> banner3;
  List<Banner> banner4;
  List<dynamic> banner5;
  List<dynamic> recentviews;
  List<BestSeller> ourProducts;
  List<BestSeller> suggestedProducts;
  List<BestSeller> bestSeller;
  List<BestSeller> flashSail;
  List<dynamic> newarrivals;
  List<Ory> categories;
  List<Ory> topAccessories;
  List<Featuredbrand> featuredbrands;
  int cartcount;
  dynamic wishlistcount;
  Currency currency;
  int notificationCount;

  ProductModel({
    required this.success,
    required this.message,
    required this.banner1,
    required this.banner2,
    required this.banner3,
    required this.banner4,
    required this.banner5,
    required this.recentviews,
    required this.ourProducts,
    required this.suggestedProducts,
    required this.bestSeller,
    required this.flashSail,
    required this.newarrivals,
    required this.categories,
    required this.topAccessories,
    required this.featuredbrands,
    required this.cartcount,
    required this.wishlistcount,
    required this.currency,
    required this.notificationCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json['success'],
      message: json['message'],
      banner1:
          List<Banner>.from(json['banner1'].map((x) => Banner.fromJson(x))),
      banner2: List<dynamic>.from(json['banner2']),
      banner3:
          List<Banner>.from(json['banner3'].map((x) => Banner.fromJson(x))),
      banner4:
          List<Banner>.from(json['banner4'].map((x) => Banner.fromJson(x))),
      banner5: List<dynamic>.from(json['banner5']),
      recentviews: List<dynamic>.from(json['recentviews']),
      ourProducts: List<BestSeller>.from(
          json['our_products'].map((x) => BestSeller.fromJson(x))),
      suggestedProducts: List<BestSeller>.from(
          json['suggested_products'].map((x) => BestSeller.fromJson(x))),
      bestSeller: List<BestSeller>.from(
          json['best_seller'].map((x) => BestSeller.fromJson(x))),
      flashSail: List<BestSeller>.from(
          json['flash_sail'].map((x) => BestSeller.fromJson(x))),
      newarrivals: List<dynamic>.from(json['newarrivals']),
      categories:
          List<Ory>.from(json['categories'].map((x) => Ory.fromJson(x))),
      topAccessories:
          List<Ory>.from(json['top_accessories'].map((x) => Ory.fromJson(x))),
      featuredbrands: List<Featuredbrand>.from(
          json['featured_brands'].map((x) => Featuredbrand.fromJson(x))),
      cartcount: json['cartcount'],
      wishlistcount: json['wishlistcount'],
      currency: Currency.fromJson(json['currency']),
      notificationCount: json['notification_count'],
    );
  }
}

class Banner {
  int id;
  int linkType;
  String linkValue;
  String image;
  String title;
  String subTitle;
  dynamic logo;

  Banner({
    required this.id,
    required this.linkType,
    required this.linkValue,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.logo,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      linkType: json['link_type'],
      linkValue: json['link_value'],
      image: json['image'],
      title: json['title'],
      subTitle: json['sub_title'],
      logo: json['logo'],
    );
  }
}

class BestSeller {
  int productId;
  String slug;
  String code;
  String? homeImg;
  String name;
  int? isGender;
  Store store;
  Manufacturer manufacturer;
  String oldprice;
  String price;
  String image;
  int cart;
  int wishlist;

  BestSeller({
    required this.productId,
    required this.slug,
    required this.code,
    required this.homeImg,
    required this.name,
    required this.isGender,
    required this.store,
    required this.manufacturer,
    required this.oldprice,
    required this.price,
    required this.image,
    required this.cart,
    required this.wishlist,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return BestSeller(
      productId: json['product_id'],
      slug: json['slug'],
      code: json['code'],
      homeImg: json['home_img'],
      name: json['name'],
      isGender: json['is_gender'],
      store: Store.values
          .firstWhere((e) => e.toString() == 'Store.${json['store']}'),
      manufacturer: Manufacturer.values.firstWhere(
          (e) => e.toString() == 'Manufacturer.${json['manufacturer']}'),
      oldprice: json['oldprice'],
      price: json['price'],
      image: json['image'],
      cart: json['cart'],
      wishlist: json['wishlist'],
    );
  }
}

enum Manufacturer { FURLA, LIUJO, MARELLA, MAX_CO, PENNYBLACK }

enum Store { SWAN }

class Ory {
  Featuredbrand category;

  Ory({
    required this.category,
  });

  factory Ory.fromJson(Map<String, dynamic> json) {
    return Ory(
      category: Featuredbrand.fromJson(json['category']),
    );
  }
}

class Featuredbrand {
  int id;
  String slug;
  String image;
  String name;
  String? description;

  Featuredbrand({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
    this.description,
  });

  factory Featuredbrand.fromJson(Map<String, dynamic> json) {
    return Featuredbrand(
      id: json['id'],
      slug: json['slug'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}

class Currency {
  String name;
  String code;
  String symbolLeft;
  String symbolRight;
  String value;
  int status;

  Currency({
    required this.name,
    required this.code,
    required this.symbolLeft,
    required this.symbolRight,
    required this.value,
    required this.status,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'],
      code: json['code'],
      symbolLeft: json['symbol_left'],
      symbolRight: json['symbol_right'],
      value: json['value'],
      status: json['status'],
    );
  }
}
