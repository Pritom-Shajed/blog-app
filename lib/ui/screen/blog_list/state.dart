import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/BlogListResponse.dart';
import '../base_states.dart';

class BlogListState extends BaseState {
  BlogListState() {
    ///Initialize variables
  }
  var blogListResponse = Rxn<BlogListResponse>();
  // var blogData = Rx<List<Blogs>>([]);
  ScrollController scrollController = ScrollController();
}
