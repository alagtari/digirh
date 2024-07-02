import 'package:digirh/features/news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required this.id,
  });

  final String id;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
