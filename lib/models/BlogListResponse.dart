class BlogListResponse {
  Data data;
  String message;
  int status;

  BlogListResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory BlogListResponse.fromJson(Map<String, dynamic> json) {
    return BlogListResponse(
      data: Data.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'message': message,
      'status': status,
    };
  }
}

class Data {
  Blogs blogs;

  Data({
    required this.blogs,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      blogs: Blogs.fromJson(json['blogs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'blogs': blogs.toJson(),
    };
  }
}

class Blogs {
  int currentPage;
  List<Blog> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Blogs({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Blogs.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Blog> dataList = list.map((i) => Blog.fromJson(i)).toList();

    var linksList = json['links'] as List;
    List<Link> linksData = linksList.map((i) => Link.fromJson(i)).toList();

    return Blogs(
      currentPage: json['current_page'],
      data: dataList,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: linksData,
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': data.map((e) => e.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links.map((e) => e.toJson()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }
}

class Blog {
  int id;
  int categoryId;
  String title;
  String subTitle;
  String slug;
  String description;
  dynamic image;
  dynamic video;
  String date;
  String status;
  int createdBy;
  int updatedBy;
  String createdAt;
  String updatedAt;

  Blog({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.subTitle,
    required this.slug,
    required this.description,
    required this.image,
    required this.video,
    required this.date,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      categoryId: json['category_id'],
      title: json['title'],
      subTitle: json['sub_title'],
      slug: json['slug'],
      description: json['description'],
      image: json['image'],
      video: json['video'],
      date: json['date'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'title': title,
      'sub_title': subTitle,
      'slug': slug,
      'description': description,
      'image': image,
      'video': video,
      'date': date,
      'status': status,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Link {
  dynamic url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'label': label,
      'active': active,
    };
  }
}
