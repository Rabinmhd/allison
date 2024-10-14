// ignore_for_file: constant_identifier_names

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
}

enum Manufacturer { FURLA, LIUJO, MARELLA, MAX_CO, PENNYBLACK }

enum Store { SWAN }

class Ory {
  Featuredbrand category;

  Ory({
    required this.category,
  });
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
}
