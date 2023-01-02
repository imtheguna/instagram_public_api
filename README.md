# blogger_api 

This package to get Google Blogger Post and Page details from Blog using Blogger API.

## Demo

https://user-images.githubusercontent.com/58139175/210208088-1dbc9bc8-c5dc-4fd7-ad47-a4d0149facbb.mp4


## Platform integration 

You don't need to include the google-services.json file in your app unless you are using Google services that require it. You do need to enable the Blogger API, using the [Google Cloud Platform API manager](https://console.cloud.google.com/apis/library/blogger.googleapis.com?project=docs-372812), and Create New Project the Go to Credentials Page and Create New credentials For API Key.


### How to Use 

To use blogger_api, first start by importing the package.
```dart
import 'package:blogger_api/blogger_api.dart';
```

```
BloggerAPI bloggerAPI = BloggerAPI()
```


### Get Blog Details By Id

```
bloggerAPI.getBlogByID(
    blogId: 'Your Blog Id', 
    apiKey: 'Your API Key' 
)
```

Return Type  `Future<BlogsModel>`


### Get All the Blog Details By Ids

```
bloggerAPI.getBlogByID(
    blogId: ['Your Blog Ids'], 
    apiKey: 'Your API Key' 
)
```

Return Type `Future<List<BlogsModel>>` 


### Get All the Post Details By Blog Id

```
bloggerAPI.getAllPostFromBlog(
    blogId: 'Your Blog Ids', 
    apiKey: 'Your API Key' 
    includeComment: false // If need you can read all the Comments from Posts.
)
```

Return Type `Future<PostModel>`

### Get All the Page Details By Blog Id

```
bloggerAPI.getAllPageFromBlog(
    blogId: 'Your Blog Ids', 
    apiKey: 'Your API Key' 
)
```

Return Type `Future<PageModel>`

`Author` and `Replies`  included in `PostItemModel` so can you read author and replies from Posts

### Project Created & Maintained By

### Gunanithi

Passionate #Flutter, #Android Developer. #UI Designer.


<a href="https://www.linkedin.com/in/gunanithi-cs/"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>

### Currently Available Methods

