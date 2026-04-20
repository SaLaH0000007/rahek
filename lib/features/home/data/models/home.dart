// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

HomeModel categoryFromJson(String str) => HomeModel.fromJson(json.decode(str));

String categoryToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  bool success;
  String message;
  int defaultStoreId;
  List<AllowedCurrency> allowedCurrencies;
  String defaultCurrency;
  bool showSwatchOnCollection;
  PriceFormat priceFormat;
  String themeCode;
  String bannerType;
  String videoUrl;
  List<BannerImage> bannerImages;
  List<BannerImage> gallaryList;
  List<CategoryElement> categories;
  bool wishlistEnable;
  List<FeaturedCategory> featuredCategories;
  List<Store> storeData;
  List<Carousel> carousel;
  String customerName;
  String customerEmail;
  int cartCount;
  String customerBannerImage;
  String bannerDominantColor;
  String customerProfileImage;
  String customerDominantColor;
  List<CmsDatum> cmsData;
  String eTag;
  int sliderTimer;
  List<Partner> partners;
  List<dynamic> flashDeals;
  List<Ad> ads;
  List<Promotion> promotions;
  Titles titles;
  HomeSeo homeSeo;
  List<HeaderContent> headerContent;
  dynamic industry;

  HomeModel({
    required this.success,
    required this.message,
    required this.defaultStoreId,
    required this.allowedCurrencies,
    required this.defaultCurrency,
    required this.showSwatchOnCollection,
    required this.priceFormat,
    required this.themeCode,
    required this.bannerType,
    required this.videoUrl,
    required this.bannerImages,
    required this.gallaryList,
    required this.categories,
    required this.wishlistEnable,
    required this.featuredCategories,
    required this.storeData,
    required this.carousel,
    required this.customerName,
    required this.customerEmail,
    required this.cartCount,
    required this.customerBannerImage,
    required this.bannerDominantColor,
    required this.customerProfileImage,
    required this.customerDominantColor,
    required this.cmsData,
    required this.eTag,
    required this.sliderTimer,
    required this.partners,
    required this.flashDeals,
    required this.ads,
    required this.promotions,
    required this.titles,
    required this.homeSeo,
    required this.headerContent,
    required this.industry,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    success: json["success"],
    message: json["message"],
    defaultStoreId: json["defaultStoreId"],
    allowedCurrencies: List<AllowedCurrency>.from(
      json["allowedCurrencies"].map((x) => AllowedCurrency.fromJson(x)),
    ),
    defaultCurrency: json["defaultCurrency"],
    showSwatchOnCollection: json["showSwatchOnCollection"],
    priceFormat: PriceFormat.fromJson(json["priceFormat"]),
    themeCode: json["themeCode"],
    bannerType: json["bannerType"],
    videoUrl: json["videoUrl"],
    bannerImages: List<BannerImage>.from(
      json["bannerImages"].map((x) => BannerImage.fromJson(x)),
    ),
    gallaryList: List<BannerImage>.from(
      json["gallaryList"].map((x) => BannerImage.fromJson(x)),
    ),
    categories: List<CategoryElement>.from(
      json["categories"].map((x) => CategoryElement.fromJson(x)),
    ),
    wishlistEnable: json["wishlistEnable"],
    featuredCategories: List<FeaturedCategory>.from(
      json["featuredCategories"].map((x) => FeaturedCategory.fromJson(x)),
    ),
    storeData: List<Store>.from(
      json["storeData"].map((x) => Store.fromJson(x)),
    ),
    carousel: List<Carousel>.from(
      json["carousel"].map((x) => Carousel.fromJson(x)),
    ),
    customerName: json["customerName"],
    customerEmail: json["customerEmail"],
    cartCount: json["cartCount"],
    customerBannerImage: json["customerBannerImage"],
    bannerDominantColor: json["bannerDominantColor"],
    customerProfileImage: json["customerProfileImage"],
    customerDominantColor: json["customerDominantColor"],
    cmsData: List<CmsDatum>.from(
      json["cmsData"].map((x) => CmsDatum.fromJson(x)),
    ),
    eTag: json["eTag"],
    sliderTimer: json["slider_timer"],
    partners: List<Partner>.from(
      json["partners"].map((x) => Partner.fromJson(x)),
    ),
    flashDeals: List<dynamic>.from(json["flashDeals"].map((x) => x)),
    ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
    promotions: List<Promotion>.from(
      json["promotions"].map((x) => Promotion.fromJson(x)),
    ),
    titles: Titles.fromJson(json["titles"]),
    homeSeo: HomeSeo.fromJson(json["homeSEO"]),
    headerContent: List<HeaderContent>.from(
      json["headerContent"].map((x) => HeaderContent.fromJson(x)),
    ),
    industry: json["industry"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "defaultStoreId": defaultStoreId,
    "allowedCurrencies": List<dynamic>.from(
      allowedCurrencies.map((x) => x.toJson()),
    ),
    "defaultCurrency": defaultCurrency,
    "showSwatchOnCollection": showSwatchOnCollection,
    "priceFormat": priceFormat.toJson(),
    "themeCode": themeCode,
    "bannerType": bannerType,
    "videoUrl": videoUrl,
    "bannerImages": List<dynamic>.from(bannerImages.map((x) => x.toJson())),
    "gallaryList": List<dynamic>.from(gallaryList.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "wishlistEnable": wishlistEnable,
    "featuredCategories": List<dynamic>.from(
      featuredCategories.map((x) => x.toJson()),
    ),
    "storeData": List<dynamic>.from(storeData.map((x) => x.toJson())),
    "carousel": List<dynamic>.from(carousel.map((x) => x.toJson())),
    "customerName": customerName,
    "customerEmail": customerEmail,
    "cartCount": cartCount,
    "customerBannerImage": customerBannerImage,
    "bannerDominantColor": bannerDominantColor,
    "customerProfileImage": customerProfileImage,
    "customerDominantColor": customerDominantColor,
    "cmsData": List<dynamic>.from(cmsData.map((x) => x.toJson())),
    "eTag": eTag,
    "slider_timer": sliderTimer,
    "partners": List<dynamic>.from(partners.map((x) => x.toJson())),
    "flashDeals": List<dynamic>.from(flashDeals.map((x) => x)),
    "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
    "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
    "titles": titles.toJson(),
    "homeSEO": homeSeo.toJson(),
    "headerContent": List<dynamic>.from(headerContent.map((x) => x.toJson())),
    "industry": industry,
  };
}

class Ad {
  int id;
  String url;
  String link;
  String redirectData;
  String? position;
  bool? isActive;

  Ad({
    required this.id,
    required this.url,
    required this.link,
    required this.redirectData,
    this.position,
    this.isActive,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    url: json["url"],
    link: json["link"],
    redirectData: json["redirect_data"],
    position: json["position"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "link": link,
    "redirect_data": redirectData,
    "position": position,
    "is_active": isActive,
  };
}

class AllowedCurrency {
  int id;
  String label;
  String symbol;
  String code;

  AllowedCurrency({
    required this.id,
    required this.label,
    required this.symbol,
    required this.code,
  });

  factory AllowedCurrency.fromJson(Map<String, dynamic> json) =>
      AllowedCurrency(
        id: json["id"],
        label: json["label"],
        symbol: json["symbol"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "symbol": symbol,
    "code": code,
  };
}

class BannerImage {
  String url;
  String dominantColor;
  String bannerType;
  int id;
  String name;
  String sliderPath;
  RedirectData redirectData;

  BannerImage({
    required this.url,
    required this.dominantColor,
    required this.bannerType,
    required this.id,
    required this.name,
    required this.sliderPath,
    required this.redirectData,
  });

  factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
    url: json["url"],
    dominantColor: json["dominantColor"],
    bannerType: json["bannerType"],
    id: json["id"],
    name: json["name"],
    sliderPath: json["slider_path"],
    redirectData: RedirectData.fromJson(json["redirect_data"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "dominantColor": dominantColor,
    "bannerType": bannerType,
    "id": id,
    "name": name,
    "slider_path": sliderPath,
    "redirect_data": redirectData.toJson(),
  };
}

class RedirectData {
  Type type;
  String? url;
  int id;

  RedirectData({required this.type, this.url, required this.id});

  factory RedirectData.fromJson(Map<String, dynamic> json) => RedirectData(
    type: typeValues.map[json["type"]]!,
    url: json["url"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "url": url,
    "id": id,
  };
}

enum Type { CATEGORY, EXTERNAL, PRODUCT }

final typeValues = EnumValues({
  "category": Type.CATEGORY,
  "external": Type.EXTERNAL,
  "product": Type.PRODUCT,
});

class Carousel {
  int id;
  String type;
  String label;
  int color;
  dynamic image;
  String dominantColor;
  List<CarouselProductList> productList;

  Carousel({
    required this.id,
    required this.type,
    required this.label,
    required this.color,
    required this.image,
    required this.dominantColor,
    required this.productList,
  });

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
    id: json["id"],
    type: json["type"],
    label: json["label"],
    color: json["color"],
    image: json["image"],
    dominantColor: json["dominantColor"],
    productList: List<CarouselProductList>.from(
      json["productList"].map((x) => CarouselProductList.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "label": label,
    "color": color,
    "image": image,
    "dominantColor": dominantColor,
    "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
  };
}

class CarouselProductList {
  List<dynamic> configurableData;
  bool isInWishlist;
  int wishlistItemId;
  TypeId typeId;
  int entityId;
  dynamic shortDescription;
  String rating;
  String availability;
  bool isAvailable;
  List<dynamic> variation;
  int price;
  String formattedPrice;
  int finalPrice;
  String formattedFinalPrice;
  double specialPrice;
  String formatedSpecialPrice;
  dynamic convertedSpecialPrice;
  String formatedConvertedSpecialPrice;
  String? name;
  bool hasRequiredOptions;
  int isNew;
  bool isInRange;
  String thumbNail;
  int minAddToCartQty;
  int negotiable;
  String? negotiableLabel;
  int orderMinQuantity;
  int orderMaxQuantity;
  int position;
  List<ImageGallery> imageGallery;
  bool isAllowedGuestCheckout;

  CarouselProductList({
    required this.configurableData,
    required this.isInWishlist,
    required this.wishlistItemId,
    required this.typeId,
    required this.entityId,
    required this.shortDescription,
    required this.rating,
    required this.availability,
    required this.isAvailable,
    required this.variation,
    required this.price,
    required this.formattedPrice,
    required this.finalPrice,
    required this.formattedFinalPrice,
    required this.specialPrice,
    required this.formatedSpecialPrice,
    required this.convertedSpecialPrice,
    required this.formatedConvertedSpecialPrice,
    required this.name,
    required this.hasRequiredOptions,
    required this.isNew,
    required this.isInRange,
    required this.thumbNail,
    required this.minAddToCartQty,
    required this.negotiable,
    required this.negotiableLabel,
    required this.orderMinQuantity,
    required this.orderMaxQuantity,
    required this.position,
    required this.imageGallery,
    required this.isAllowedGuestCheckout,
  });

  factory CarouselProductList.fromJson(Map<String, dynamic> json) =>
      CarouselProductList(
        configurableData: List<dynamic>.from(
          json["configurableData"].map((x) => x),
        ),
        isInWishlist: json["isInWishlist"],
        wishlistItemId: json["wishlistItemId"],
        typeId: typeIdValues.map[json["typeId"]]!,
        entityId: json["entityId"],
        shortDescription: json["shortDescription"],
        rating: json["rating"],
        availability: json["availability"],
        isAvailable: json["isAvailable"],
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        price: json["price"],
        formattedPrice: json["formattedPrice"],
        finalPrice: json["finalPrice"],
        formattedFinalPrice: json["formattedFinalPrice"],
        specialPrice: json["specialPrice"]?.toDouble(),
        formatedSpecialPrice: json["formatedSpecialPrice"],
        convertedSpecialPrice: json["convertedSpecialPrice"],
        formatedConvertedSpecialPrice: json["formatedConvertedSpecialPrice"],
        name: json["name"],
        hasRequiredOptions: json["hasRequiredOptions"],
        isNew: json["isNew"],
        isInRange: json["isInRange"],
        thumbNail: json["thumbNail"],
        minAddToCartQty: json["minAddToCartQty"],
        negotiable: json["negotiable"],
        negotiableLabel: json["negotiable_label"],
        orderMinQuantity: json["order_min_quantity"],
        orderMaxQuantity: json["order_max_quantity"],
        position: json["position"],
        imageGallery: List<ImageGallery>.from(
          json["imageGallery"].map((x) => ImageGallery.fromJson(x)),
        ),
        isAllowedGuestCheckout: json["isAllowedGuestCheckout"],
      );

  Map<String, dynamic> toJson() => {
    "configurableData": List<dynamic>.from(configurableData.map((x) => x)),
    "isInWishlist": isInWishlist,
    "wishlistItemId": wishlistItemId,
    "typeId": typeIdValues.reverse[typeId],
    "entityId": entityId,
    "shortDescription": shortDescription,
    "rating": rating,
    "availability": availability,
    "isAvailable": isAvailable,
    "variation": List<dynamic>.from(variation.map((x) => x)),
    "price": price,
    "formattedPrice": formattedPrice,
    "finalPrice": finalPrice,
    "formattedFinalPrice": formattedFinalPrice,
    "specialPrice": specialPrice,
    "formatedSpecialPrice": formatedSpecialPrice,
    "convertedSpecialPrice": convertedSpecialPrice,
    "formatedConvertedSpecialPrice": formatedConvertedSpecialPrice,
    "name": name,
    "hasRequiredOptions": hasRequiredOptions,
    "isNew": isNew,
    "isInRange": isInRange,
    "thumbNail": thumbNail,
    "minAddToCartQty": minAddToCartQty,
    "negotiable": negotiable,
    "negotiable_label": negotiableLabel,
    "order_min_quantity": orderMinQuantity,
    "order_max_quantity": orderMaxQuantity,
    "position": position,
    "imageGallery": List<dynamic>.from(imageGallery.map((x) => x.toJson())),
    "isAllowedGuestCheckout": isAllowedGuestCheckout,
  };
}

class ImageGallery {
  int imageId;
  String smallImage;
  String mediumImage;
  String largeImage;

  ImageGallery({
    required this.imageId,
    required this.smallImage,
    required this.mediumImage,
    required this.largeImage,
  });

  factory ImageGallery.fromJson(Map<String, dynamic> json) => ImageGallery(
    imageId: json["image_id"],
    smallImage: json["smallImage"],
    mediumImage: json["mediumImage"],
    largeImage: json["largeImage"],
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId,
    "smallImage": smallImage,
    "mediumImage": mediumImage,
    "largeImage": largeImage,
  };
}

enum TypeId { CONFIGURABLE, SIMPLE, VIRTUAL }

final typeIdValues = EnumValues({
  "configurable": TypeId.CONFIGURABLE,
  "simple": TypeId.SIMPLE,
  "virtual": TypeId.VIRTUAL,
});

class CategoryElement {
  int id;
  String name;
  bool hasChildren;
  String thumbnail;
  String thumbnailDominantColor;
  String banner;
  String bannerDominantColor;

  CategoryElement({
    required this.id,
    required this.name,
    required this.hasChildren,
    required this.thumbnail,
    required this.thumbnailDominantColor,
    required this.banner,
    required this.bannerDominantColor,
  });

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        id: json["id"],
        name: json["name"],
        hasChildren: json["hasChildren"],
        thumbnail: json["thumbnail"],
        thumbnailDominantColor: json["thumbnailDominantColor"],
        banner: json["banner"],
        bannerDominantColor: json["bannerDominantColor"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "hasChildren": hasChildren,
    "thumbnail": thumbnail,
    "thumbnailDominantColor": thumbnailDominantColor,
    "banner": banner,
    "bannerDominantColor": bannerDominantColor,
  };
}

class CmsDatum {
  int id;
  String title;

  CmsDatum({required this.id, required this.title});

  factory CmsDatum.fromJson(Map<String, dynamic> json) =>
      CmsDatum(id: json["id"], title: json["title"]);

  Map<String, dynamic> toJson() => {"id": id, "title": title};
}

class FeaturedCategory {
  String imageUrl;
  String dominantColor;
  int categoryId;
  String categoryName;
  List<FeaturedCategoryProductList> productList;

  FeaturedCategory({
    required this.imageUrl,
    required this.dominantColor,
    required this.categoryId,
    required this.categoryName,
    required this.productList,
  });

  factory FeaturedCategory.fromJson(Map<String, dynamic> json) =>
      FeaturedCategory(
        imageUrl: json["image_url"],
        dominantColor: json["dominantColor"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        productList: List<FeaturedCategoryProductList>.from(
          json["productList"].map(
            (x) => FeaturedCategoryProductList.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "dominantColor": dominantColor,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
  };
}

class FeaturedCategoryProductList {
  List<dynamic> configurableData;
  bool isInWishlist;
  int wishlistItemId;
  TypeId typeId;
  int entityId;
  dynamic shortDescription;
  int rating;
  String availability;
  bool isAvailable;
  List<dynamic> variation;
  int price;
  String formattedPrice;
  int finalPrice;
  String formattedFinalPrice;
  double specialPrice;
  String formatedSpecialPrice;
  dynamic convertedSpecialPrice;
  String formatedConvertedSpecialPrice;
  String? name;
  bool hasRequiredOptions;
  int isNew;
  bool isInRange;
  String thumbNail;
  int minAddToCartQty;
  int negotiable;
  String? negotiableLabel;
  int orderMinQuantity;
  int orderMaxQuantity;
  int position;
  List<dynamic> imageGallery;
  bool isAllowedGuestCheckout;

  FeaturedCategoryProductList({
    required this.configurableData,
    required this.isInWishlist,
    required this.wishlistItemId,
    required this.typeId,
    required this.entityId,
    required this.shortDescription,
    required this.rating,
    required this.availability,
    required this.isAvailable,
    required this.variation,
    required this.price,
    required this.formattedPrice,
    required this.finalPrice,
    required this.formattedFinalPrice,
    required this.specialPrice,
    required this.formatedSpecialPrice,
    required this.convertedSpecialPrice,
    required this.formatedConvertedSpecialPrice,
    required this.name,
    required this.hasRequiredOptions,
    required this.isNew,
    required this.isInRange,
    required this.thumbNail,
    required this.minAddToCartQty,
    required this.negotiable,
    required this.negotiableLabel,
    required this.orderMinQuantity,
    required this.orderMaxQuantity,
    required this.position,
    required this.imageGallery,
    required this.isAllowedGuestCheckout,
  });

  factory FeaturedCategoryProductList.fromJson(Map<String, dynamic> json) =>
      FeaturedCategoryProductList(
        configurableData: List<dynamic>.from(
          json["configurableData"].map((x) => x),
        ),
        isInWishlist: json["isInWishlist"],
        wishlistItemId: json["wishlistItemId"],
        typeId: typeIdValues.map[json["typeId"]]!,
        entityId: json["entityId"],
        shortDescription: json["shortDescription"],
        rating: json["rating"],
        availability: json["availability"],
        isAvailable: json["isAvailable"],
        variation: List<dynamic>.from(json["variation"].map((x) => x)),
        price: json["price"],
        formattedPrice: json["formattedPrice"],
        finalPrice: json["finalPrice"],
        formattedFinalPrice: json["formattedFinalPrice"],
        specialPrice: json["specialPrice"]?.toDouble(),
        formatedSpecialPrice: json["formatedSpecialPrice"],
        convertedSpecialPrice: json["convertedSpecialPrice"],
        formatedConvertedSpecialPrice: json["formatedConvertedSpecialPrice"],
        name: json["name"],
        hasRequiredOptions: json["hasRequiredOptions"],
        isNew: json["isNew"],
        isInRange: json["isInRange"],
        thumbNail: json["thumbNail"],
        minAddToCartQty: json["minAddToCartQty"],
        negotiable: json["negotiable"],
        negotiableLabel: json["negotiable_label"],
        orderMinQuantity: json["order_min_quantity"],
        orderMaxQuantity: json["order_max_quantity"],
        position: json["position"],
        imageGallery: List<dynamic>.from(json["imageGallery"].map((x) => x)),
        isAllowedGuestCheckout: json["isAllowedGuestCheckout"],
      );

  Map<String, dynamic> toJson() => {
    "configurableData": List<dynamic>.from(configurableData.map((x) => x)),
    "isInWishlist": isInWishlist,
    "wishlistItemId": wishlistItemId,
    "typeId": typeIdValues.reverse[typeId],
    "entityId": entityId,
    "shortDescription": shortDescription,
    "rating": rating,
    "availability": availability,
    "isAvailable": isAvailable,
    "variation": List<dynamic>.from(variation.map((x) => x)),
    "price": price,
    "formattedPrice": formattedPrice,
    "finalPrice": finalPrice,
    "formattedFinalPrice": formattedFinalPrice,
    "specialPrice": specialPrice,
    "formatedSpecialPrice": formatedSpecialPrice,
    "convertedSpecialPrice": convertedSpecialPrice,
    "formatedConvertedSpecialPrice": formatedConvertedSpecialPrice,
    "name": name,
    "hasRequiredOptions": hasRequiredOptions,
    "isNew": isNew,
    "isInRange": isInRange,
    "thumbNail": thumbNail,
    "minAddToCartQty": minAddToCartQty,
    "negotiable": negotiable,
    "negotiable_label": negotiableLabel,
    "order_min_quantity": orderMinQuantity,
    "order_max_quantity": orderMaxQuantity,
    "position": position,
    "imageGallery": List<dynamic>.from(imageGallery.map((x) => x)),
    "isAllowedGuestCheckout": isAllowedGuestCheckout,
  };
}

class HeaderContent {
  int id;
  int contentId;
  int companyId;
  String? title;
  dynamic customTitle;
  dynamic customHeading;
  String pageLink;
  int linkTarget;
  dynamic catalogType;
  dynamic products;
  dynamic description;
  String locale;
  dynamic createdAt;
  dynamic updatedAt;
  String contentType;
  String? link;

  HeaderContent({
    required this.id,
    required this.contentId,
    required this.companyId,
    required this.title,
    required this.customTitle,
    required this.customHeading,
    required this.pageLink,
    required this.linkTarget,
    required this.catalogType,
    required this.products,
    required this.description,
    required this.locale,
    required this.createdAt,
    required this.updatedAt,
    required this.contentType,
    required this.link,
  });

  factory HeaderContent.fromJson(Map<String, dynamic> json) => HeaderContent(
    id: json["id"],
    contentId: json["content_id"],
    companyId: json["company_id"],
    title: json["title"],
    customTitle: json["custom_title"],
    customHeading: json["custom_heading"],
    pageLink: json["page_link"],
    linkTarget: json["link_target"],
    catalogType: json["catalog_type"],
    products: json["products"],
    description: json["description"],
    locale: json["locale"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    contentType: json["content_type"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content_id": contentId,
    "company_id": companyId,
    "title": title,
    "custom_title": customTitle,
    "custom_heading": customHeading,
    "page_link": pageLink,
    "link_target": linkTarget,
    "catalog_type": catalogType,
    "products": products,
    "description": description,
    "locale": locale,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "content_type": contentType,
    "link": link,
  };
}

class HomeSeo {
  String metaTitle;
  String metaDescription;
  String metaKeywords;

  HomeSeo({
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
  });

  factory HomeSeo.fromJson(Map<String, dynamic> json) => HomeSeo(
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
  );

  Map<String, dynamic> toJson() => {
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
  };
}

class Partner {
  int id;
  int companyId;
  String title;
  String path;
  String url;
  Locale locale;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;
  RedirectData redirectData;

  Partner({
    required this.id,
    required this.companyId,
    required this.title,
    required this.path,
    required this.url,
    required this.locale,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.redirectData,
  });

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
    id: json["id"],
    companyId: json["company_id"],
    title: json["title"],
    path: json["path"],
    url: json["url"],
    locale: localeValues.map[json["locale"]]!,
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    imageUrl: json["image_url"],
    redirectData: RedirectData.fromJson(json["redirect_data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "title": title,
    "path": path,
    "url": url,
    "locale": localeValues.reverse[locale],
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image_url": imageUrl,
    "redirect_data": redirectData.toJson(),
  };
}

enum Locale { AR_EN }

final localeValues = EnumValues({"ar,en": Locale.AR_EN});

class PriceFormat {
  String pattern;
  int precision;
  int requiredPrecision;
  String decimalSymbol;
  String groupSymbol;
  int groupLength;
  int integerRequired;

  PriceFormat({
    required this.pattern,
    required this.precision,
    required this.requiredPrecision,
    required this.decimalSymbol,
    required this.groupSymbol,
    required this.groupLength,
    required this.integerRequired,
  });

  factory PriceFormat.fromJson(Map<String, dynamic> json) => PriceFormat(
    pattern: json["pattern"],
    precision: json["precision"],
    requiredPrecision: json["requiredPrecision"],
    decimalSymbol: json["decimalSymbol"],
    groupSymbol: json["groupSymbol"],
    groupLength: json["groupLength"],
    integerRequired: json["integerRequired"],
  );

  Map<String, dynamic> toJson() => {
    "pattern": pattern,
    "precision": precision,
    "requiredPrecision": requiredPrecision,
    "decimalSymbol": decimalSymbol,
    "groupSymbol": groupSymbol,
    "groupLength": groupLength,
    "integerRequired": integerRequired,
  };
}

class Promotion {
  String icon;
  String head;
  String desc;

  Promotion({required this.icon, required this.head, required this.desc});

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      Promotion(icon: json["icon"], head: json["head"], desc: json["desc"]);

  Map<String, dynamic> toJson() => {"icon": icon, "head": head, "desc": desc};
}

class Store {
  int id;
  String name;
  String code;
  List<Store>? stores;
  int? localeId;

  Store({
    required this.id,
    required this.name,
    required this.code,
    this.stores,
    this.localeId,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    code: json["code"],
    stores: json["stores"] == null
        ? []
        : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
    localeId: json["locale_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
    "stores": stores == null
        ? []
        : List<dynamic>.from(stores!.map((x) => x.toJson())),
    "locale_id": localeId,
  };
}

class Titles {
  String onSale;
  String newProducts;
  String featuredProducts;
  String recentlyViewed;
  String topSale;

  Titles({
    required this.onSale,
    required this.newProducts,
    required this.featuredProducts,
    required this.recentlyViewed,
    required this.topSale,
  });

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
    onSale: json["on_sale"],
    newProducts: json["new_products"],
    featuredProducts: json["featured_products"],
    recentlyViewed: json["recently_viewed"],
    topSale: json["top_sale"],
  );

  Map<String, dynamic> toJson() => {
    "on_sale": onSale,
    "new_products": newProducts,
    "featured_products": featuredProducts,
    "recently_viewed": recentlyViewed,
    "top_sale": topSale,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
