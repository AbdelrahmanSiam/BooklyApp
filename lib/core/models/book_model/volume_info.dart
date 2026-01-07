import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

part 'volume_info.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends Equatable {
  @HiveField(0)
  final String? title;

  @HiveField(1)
  final List<String>? authors;

  @HiveField(2)
  final String? publishedDate;


  // @HiveField(4)
  // final ReadingModes? readingModes;

  @HiveField(5)
  final int? pageCount;

  @HiveField(6)
  final String? printType;

  @HiveField(7)
  final List<String>? categories;

  @HiveField(8)
  final double? averageRating;

  @HiveField(9)
  final int? ratingsCount;

  @HiveField(10)
  final String? maturityRating;

  @HiveField(11)
  final bool? allowAnonLogging;

  @HiveField(12)
  final String? contentVersion;


  @HiveField(14)
  final ImageLinks? imageLinks;

  @HiveField(15)
  final String? language;

  @HiveField(16)
  final String? previewLink;

  @HiveField(17)
  final String? infoLink;

  @HiveField(18)
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.title,
    this.authors,
    this.publishedDate,
    // this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromBookJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
        publishedDate: json['publishedDate'] as String?,

        // readingModes: json['readingModes'] == null
        //     ? null
        //     : ReadingModes.fromBookJson(
        //         json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int?,
        printType: json['printType'] as String?,
        categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
        averageRating: (json['averageRating'] as num?)?.toDouble(),
        ratingsCount: json['ratingsCount'] as int?,
        maturityRating: json['maturityRating'] as String?,
        allowAnonLogging: json['allowAnonLogging'] as bool?,
        contentVersion: json['contentVersion'] as String?,

        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromBookJson(
                json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      );

  Map<String, dynamic> toBookJson() => {
        'title': title,
        'authors': authors,
        'publishedDate': publishedDate,
        // 'industryIdentifiers':
        // 'readingModes': readingModes?.toBookJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'imageLinks': imageLinks?.toBookJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props => [
        title,
        authors,
        publishedDate,
        // readingModes,
        pageCount,
        printType,
        categories,
        averageRating,
        ratingsCount,
        maturityRating,
        allowAnonLogging,
        contentVersion,
        imageLinks,
        language,
        previewLink,
        infoLink,
        canonicalVolumeLink,
      ];
}
