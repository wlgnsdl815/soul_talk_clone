import 'package:get/get.dart';
import 'package:soul_talk_clone/data_source/auth_data_source.dart';

class DataSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthDataSource(), fenix: true);
  }
}
