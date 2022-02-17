class Post{

  final String userPhoto;
  final String userName;
  final String postPhoto;
  final String caption;
  final String date;
  final int likes;
  final List<String> topsLikes;

  Post({
    required this.userPhoto,
    required this.userName,
    required this.postPhoto,
    required this.caption,
    required this.date,
    required this.likes,
    required this.topsLikes
  });

}