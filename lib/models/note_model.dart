import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final String modifiedTime;
  //DateTime modifiedTime;

  Note({
    required this.title,
    required this.body,
    required this.modifiedTime,
  });
}