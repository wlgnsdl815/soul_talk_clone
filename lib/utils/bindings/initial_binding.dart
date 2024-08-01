import 'package:get/get.dart';
import 'package:soul_talk_clone/utils/bindings/data_source_binding.dart';
import 'package:soul_talk_clone/utils/bindings/view_model_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    ViewModelBindings().dependencies();
    DataSourceBindings().dependencies();
    // RepositoryBindings().dependencies();
  }
}
