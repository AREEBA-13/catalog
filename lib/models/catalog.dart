// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  // Get item by id
  Item getById(String id) => items.firstWhere(
        (element) => element.id == id,
        orElse: () => Item(
          id: '',
          name: '',
          des: '',
          price: 0,
          color: '',
          image: '',
        ),
      );

  // Get item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final String id;
  final String name;
  final String des;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.des,
    required this.price,
    required this.color,
    required this.image,
  });

  Item copyWith({
    String? id,
    String? name,
    String? des,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      des: des ?? this.des,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'des': des,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      des: map['des']?.toString() ?? '',
      price: map['price'] is num
          ? map['price'] as num
          : num.tryParse(map['price']?.toString() ?? '0') ?? 0,
      color: map['color']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, des: $des, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.des == des &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        des.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
