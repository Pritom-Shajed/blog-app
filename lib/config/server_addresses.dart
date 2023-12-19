class ServerAddresses {

  ServerAddresses._privateConstructor();
  static final ServerAddresses _instance = ServerAddresses._privateConstructor();
  static ServerAddresses get instance => _instance;

  static const _baseUrl = "https://apitest.smartsoft-bd.com";
  static const _userLogin = "/api/login";
  static const _blogList = "/api/admin/blog-news";
  static const _blogStore = "/api/admin/blog-news/store";
  static const _blogUpdate = "/api/admin/blog-news/update/{id}";
  static const _blogDelete = "/api/admin/blog-news/delete/{id}";

  static get baseUrl => _baseUrl;
  static get userLogin => _userLogin;
  static get blogList => _blogList;
  static get blogStore => _blogStore;
  static get blogUpdate => _blogUpdate;
  static get blogDelete => _blogDelete;
}