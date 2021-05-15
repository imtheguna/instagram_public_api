import 'package:flutter_test/flutter_test.dart';

import 'package:instagram_public_api/instagram_public_api.dart';

void main() {
  test("Insta", () async {
    FlutterInsta insta = FlutterInsta();
    InstaProfileData user = await insta.getProfileData("thefluttercommunity");
    print(user.username);
    print(user.profilePicURL);
    print(user.bio);
    final List<InstaPost> post = await FlutterInsta().getPostData(
        "https://www.instagram.com/p/CNuL9idBnsA/?utm_source=ig_web_copy_link");
    for (int i = 0; i < post.length; i++) {
      print(post[i].postType);
      print(post[i].displayURL);
      print(post[i].user.username);
      print(post[i].videoDuration.duration);
      print(post[i].videoDuration.unit);
    }
  });
}
