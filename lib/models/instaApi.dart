import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:instagram_public_api/models/instaData.dart';

class FlutterInsta {
  Future<List<InstaPost>> getPostData(String link) async {
    final url = "$link/?__a=1";
    List listUrl = url.split("/");
    String postUrl = listUrl[0] +
        "//" +
        listUrl[2] +
        "/" +
        listUrl[3] +
        "/" +
        listUrl[4] +
        "/" +
        listUrl[6];

    final res = await http.get(Uri.parse(postUrl));
    String body = res.body;
    if (body.startsWith('<!DOCTYPE html>')) {
      log('HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
      throw Exception(
          'HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
    }
    var post = json.decode(body)["graphql"]["shortcode_media"];

    PostUserDetails user = PostUserDetails(
      followers: post["owner"]["edge_followed_by"]["count"].toString(),
      is_private: post["owner"]["is_private"],
      is_verified: post["owner"]["is_verified"],
      posts: post["owner"]["edge_owner_to_timeline_media"]["count"].toString(),
      profile_pic_url: post["owner"]["profile_pic_url"],
      username: post["owner"]["username"],
    );

    if (post["__typename"] == "GraphImage" ||
        post["__typename"] == "GraphVideo") {
      var postType = post["__typename"] == "GraphImage"
          ? PostType.GraphImage
          : PostType.GraphVideo;

      List<InstaPost> instaPost = [];
      instaPost.add(InstaPost(
          postUrl: postUrl,
          video_duration: postType == PostType.GraphVideo
              ? post["video_duration"].toString()
              : "0.0",
          thumbnailDimensions: Dimensions(
            height: post["display_resources"][0]["config_height"],
            width: post["display_resources"][0]["config_width"],
          ),
          dimensions: Dimensions(
            height: post["dimensions"]["height"],
            width: post["dimensions"]["width"],
          ),
          thumbnailUrl: post["display_resources"][0]["src"],
          display_url: postType == PostType.GraphVideo
              ? post["video_url"]
              : post["display_url"],
          postType: postType,
          user: user));
      return instaPost;
    } else if (post["__typename"] == "GraphSidecar") {
      List<InstaPost> instaPost = [];
      final snap = post["edge_sidecar_to_children"]["edges"];
      for (int i = 0; i < snap.length.toInt(); i++) {
        final postType =
            snap[i]["node"]["__typename"].toString().contains("GraphImage")
                ? PostType.GraphImage
                : PostType.GraphVideo;
        print(postType);
        print("\n\n");
        instaPost.add(InstaPost(
          postUrl: postUrl,
          video_duration: postType == PostType.GraphVideo
              ? snap[i]["node"]["video_duration"] == null
                  ? ''
                  : snap[i]["node"]["video_duration"].toString()
              : "0.0",
          thumbnailDimensions: Dimensions(
            height: snap[i]["node"]["display_resources"][0]["config_height"],
            width: snap[i]["node"]["display_resources"][0]["config_width"],
          ),
          dimensions: Dimensions(
            height: snap[i]["node"]["dimensions"]["height"],
            width: snap[i]["node"]["dimensions"]["width"],
          ),
          thumbnailUrl: snap[i]["node"]["display_resources"][0]["src"],
          display_url: postType == PostType.GraphImage
              ? snap[i]["node"]["display_url"]
              : snap[i]["node"]["video_url"],
          postType: postType,
          user: user,
        ));
      }
      return instaPost;
    }
  }

  //get profile details
  Future<InstaProfileData> getProfileData(String username) async {
    final url = "https://www.instagram.com/$username/?__a=1";

    final res = await http.get(Uri.parse(url));
    String body = res.body;
    if (body.startsWith('<!DOCTYPE html>')) {
      log('HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
      throw Exception(
          'HTML was returned instead of JSON\ni.e.You might have surpassed Instagram\'s no. of requests/hour limit');
    }
    var profile = json.decode(body)["graphql"]["user"];

    InstaProfileData userProfile = InstaProfileData(
      bio: profile["biography"],
      following: profile["edge_follow"]["count"].toString(),
      followers: profile["edge_followed_by"]["count"].toString(),
      external_url: profile["external_url"],
      is_private: profile["is_private"],
      is_verified: profile["is_verified"],
      profile_pic_url: profile["profile_pic_url"],
      username: username,
    );
    return userProfile;
  }
}