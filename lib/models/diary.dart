import 'package:diary_sample/utils/common.dart' show formatDate;

class Diary {
  int id = 0;
  String title;
  String content;
  String imageUrl;
  String createdAt;

  Diary(this.id, this.title, this.content, this.imageUrl, this.createdAt);

  Diary.fromJson(Map<String, dynamic> json)
      :
        title = json['title'],
        content = json['content'],
        imageUrl = json['image_url'],
        createdAt = json['created_at'];

  Map<String, dynamic> toMap() => {
        "title": title,
        "content": content,
        "image_url": imageUrl,
        "created_at": createdAt
      };
}
