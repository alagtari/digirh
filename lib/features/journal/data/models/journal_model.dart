import 'package:digirh/features/journal/domain/entities/journal_entity.dart';

class JournalModel  extends JournalEntity {

  const JournalModel ({
    required super.id,
  });



  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
