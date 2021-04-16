import 'package:flutter_test/flutter_test.dart';

import 'package:instagram_public_api/instagram_public_api.dart';

void main() {
  test("Insta", () async {
    FlutterInsta insta = FlutterInsta();
    InstaProfileData user = await insta.getProfileData("thefluttercommunity");
    print(user.username);
    print(user.profile_pic_url);
    print(user.bio);
    final List<InstaPost> post = await FlutterInsta().getPostData(
        "https://www.instagram.com/p/CNuL9idBnsA/?utm_source=ig_web_copy_link");
    for (int i = 0; i < post.length; i++) {
      print(post[i].postType);
      print(post[i].display_url);
      print(post[i].video_duration);
    }
    // print(post[0].dimensions);
    // print(post[0].display_url);
    // print(post[0].postType);
    // print(post[0].thumbnailDimensions);
    // print(post[0].thumbnailUrl);
    // print(post[0].user.followers);
    // print(post[0].user.is_private);
    // print(post[0].user.is_verified);
    // print(post[0].user.posts);
    // print(post[0].user.profile_pic_url);
    // print(post[0]..user.username);
    // print(post[0].video_duration);
  });
}
