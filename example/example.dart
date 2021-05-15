import 'package:instagram_public_api/instagram_public_api.dart';

Future<void> main() async {
  FlutterInsta insta = FlutterInsta();
  //Get Profile Details(must be public)
  InstaProfileData user = await insta.getProfileData("thefluttercommunity");
  print(user.username);
  print(user.profilePicURL);
  print(user.bio);
  print(user.externalURL);
  print(user.followers);
  print(user.following);
  print(user.isVerified);
  print(user.isPrivate);
  print(user.username);
  //Get Post Details (Post with nested images and video and details) (must be public)
  final List<InstaPost> post = await FlutterInsta().getPostData(
      "https://www.instagram.com/p/CNuL9idBnsA/?utm_source=ig_web_copy_link");
  for (int i = 0; i < post.length; i++) {
    print(post[i].dimensions);
    print(post[i].displayURL); //post download url
    print(post[i].postType);
    print(post[i].thumbnailDimensions);
    print(post[i].thumbnailUrl);
    print(post[i].user.followers);
    print(post[i].user.isPrivate);
    print(post[i].user.isVerified);
    print(post[i].user.posts);
    print(post[i].user.profilePicURL);
    print(post[i]..user.username);
    print(post[i].videoDuration);
  }
}
