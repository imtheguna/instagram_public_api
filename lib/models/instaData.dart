class InstaPost {
  final PostType postType;
  final Dimensions dimensions;
  final String display_url;
  final String postUrl;
  final String thumbnailUrl;
  final Dimensions thumbnailDimensions;
  final String video_duration;
  final PostUserDetails user;
  InstaPost(
      {this.postType,
      this.postUrl,
      this.dimensions,
      this.display_url,
      this.video_duration,
      this.user,
      this.thumbnailDimensions,
      this.thumbnailUrl});
}

//followers: profile["edge_followed_by"]
class PostUserDetails {
  final String username;
  final String profile_pic_url;
  final bool is_private;
  final bool is_verified;
  final String followers;
  final String posts;

  PostUserDetails(
      {this.username,
      this.profile_pic_url,
      this.is_private,
      this.is_verified,
      this.followers,
      this.posts});
}

enum PostType {
  GraphImage,
  GraphVideo,
  GraphSidecar,
}

class Dimensions {
  final int height;
  final int width;

  Dimensions({this.height, this.width});
}

class InstaProfileData {
  final String username;
  final String profile_pic_url;
  final bool is_private;
  final bool is_verified;
  final String following;
  final String followers;
  final String bio;
  final String external_url;

  InstaProfileData(
      {this.username,
      this.profile_pic_url,
      this.is_private,
      this.is_verified,
      this.following,
      this.followers,
      this.bio,
      this.external_url});
}
