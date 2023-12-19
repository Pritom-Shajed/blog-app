import 'package:flutter/cupertino.dart';

import '../base_states.dart';

class BlogStoreAddState extends BaseState {
  BlogStoreAddState() {
    ///Initialize variables
  }

  TextEditingController titleController = TextEditingController(text:'');
  TextEditingController descriptionController = TextEditingController(text:'');
  TextEditingController idController = TextEditingController(text:'');
  TextEditingController dateController = TextEditingController(text:'');
}
