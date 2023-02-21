# instagram_public_api

Flutter package to get Instagram user details and download posts.

## How to Use 

To use instagram_public_api, first start by importing the package.
```dart
import 'package:instagram_public_api/instagram_public_api.dart';
```
## Get profile details

```dart
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
```
## Get Pots details

```dart
//Get Post Details (Post with nested images and video and details) (must be public)
  final List<InstaPost> post = await FlutterInsta().getPostData(
      "https://www.instagram.com/p/CLXXql8gwpo/?utm_source=ig_web_copy_link");
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
```

## Project Created & Maintained By

### Gunanithi

Passionate #Flutter, #Android Developer. #UI Designer.


<a href="https://www.linkedin.com/in/gunanithi-cs/"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>


## Currently Available Methods
- `InstaProfileData getProfileData()` returns user details
</br>

- `List<InstaPost> getPostData()` returns Post Details (Post with nested images and video and details)
</br>

## The limitations or problems you may bump into using this package.

## Rate limiting: 
    Instagram allows a maximum of around 200–300 request hits per hour. After reaching the limit, you’ll start getting the server error.
## No Insight Data: 
    You cannot get Instagram insight data using this API. Look into FB Instagram Insight API.
## No Private Account Data: 
    Since this works on publically available API’s, you cannot get private account data.


**Inspired from [this](https://medium.com/@vasu.pal/crawl-instagram-profiles-and-posts-the-most-efficient-way-possible-without-fb-graph-api-7ea270b11e74) article**

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
