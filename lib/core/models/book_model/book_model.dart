import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

part 'book_model.g.dart';
@HiveType(typeId: 0)
class BookModel extends Equatable {
  @HiveField(0)
  final String? kind;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String? etag;
  @HiveField(3)
  final String? selfLink;
  @HiveField(4)
  final VolumeInfo? volumeInfo;
  // @HiveField(5)
  // final SaleInfo? saleInfo;
  // @HiveField(6)
  // final AccessInfo? accessInfo;
  // @HiveField(7)
  // final SearchInfo? searchInfo;

  const BookModel({
    this.kind,
    required this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    // this.saleInfo,
    // this.accessInfo,
    // this.searchInfo,
  });

  factory BookModel.fromBookJson(Map<String, dynamic> json) => BookModel(
        kind: json['kind'] as String?,
        id: json['id'] as String,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromBookJson(
                json['volumeInfo'] as Map<String, dynamic>),
        // saleInfo: json['saleInfo'] == null
        //     ? null
        //     : SaleInfo.fromBookJson(json['saleInfo'] as Map<String, dynamic>),
        // accessInfo: json['accessInfo'] == null
        //     ? null
        //     : AccessInfo.fromBookJson(
        //         json['accessInfo'] as Map<String, dynamic>),
        // searchInfo: json['searchInfo'] == null
        //     ? null
        //     : SearchInfo.fromBookJson(
        //         json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toBookJson() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toBookJson(),
        // 'saleInfo': saleInfo?.toBookJson(),
        // 'accessInfo': accessInfo?.toBookJson(),
        // 'searchInfo': searchInfo?.toBookJson(),
      };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      etag,
      selfLink,
      volumeInfo,
      // saleInfo,
      // accessInfo,
      // searchInfo,
    ];
  }
}
