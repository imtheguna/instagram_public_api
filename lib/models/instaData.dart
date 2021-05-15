/// [InstaPost]
class InstaPost {
  final PostType? postType;
  final Dimensions? dimensions;
  final String? displayURL;
  final String? postUrl;
  final String? thumbnailUrl;
  final Dimensions? thumbnailDimensions;
  final PostTime videoDuration;
  final PostUserDetails user;
  InstaPost(
      {this.postType,
      this.postUrl,
      this.dimensions,
      this.displayURL,
      required this.videoDuration,
      required this.user,
      this.thumbnailDimensions,
      this.thumbnailUrl});
}

/// [PostUserDetails]
class PostUserDetails {
  final String? username;
  final String? profilePicURL;
  final bool? isPrivate;
  final bool? isVerified;
  final String? followers;
  final String? posts;

  PostUserDetails(
      {this.username,
      this.profilePicURL,
      this.isPrivate,
      this.isVerified,
      this.followers,
      this.posts});
}

/// [PostType]
enum PostType {
  GraphImage,
  GraphVideo,
  GraphSidecar,
}

/// [Dimensions]
class Dimensions {
  final int height;
  final int width;

  Dimensions({required this.height, required this.width});
}

/// [InstaProfileData]
class InstaProfileData {
  final String? username;
  final String? profilePicURL;
  final bool? isPrivate;
  final bool? isVerified;
  final String? following;
  final String? followers;
  final String? bio;
  final String? externalURL;

  InstaProfileData(
      {this.username,
      this.profilePicURL,
      this.isPrivate,
      this.isVerified,
      this.following,
      this.followers,
      this.bio,
      this.externalURL});
}

/// [PostTime]
class PostTime {
  final String duration;
  final String unit;

  PostTime({required this.duration, required this.unit});
}
