import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soul_talk_clone/data_source/local/user_data_source.dart';
import 'package:soul_talk_clone/data_source/remote/post_data_source.dart';
import 'package:soul_talk_clone/models/post_model.dart';
import 'package:soul_talk_clone/models/user_model.dart';
import 'package:soul_talk_clone/widgets/default_dialog.dart';

enum TagStatus {
  tagged,
  doNotTag,
  none,
}

class CreatePostViewModel extends GetxController {
  final PostDataSource _postDataSource = Get.find<PostDataSource>();
  final UserDataSource _userDataSource = Get.find<UserDataSource>();

  Rx<TagStatus> tagStatus = TagStatus.none.obs;
  Rxn<String> selectedCategory = Rxn();
  Rxn<String> selectedDetailCategory = Rxn();
  Rxn<String> postTitle = Rxn();
  Rxn<String> postContent = Rxn();
  RxList<String> imageList = <String>[].obs;
  RxBool buttonDisabled = true.obs;

  void selectedCounselor() {
    tagStatus.value = TagStatus.tagged;
  }

  void selectedDoNotTag() {
    tagStatus.value = TagStatus.doNotTag;
  }

  Future<void> pickImage() async {
    var photosStatus = await Permission.photos.status;

    if (!photosStatus.isGranted) {
      await Permission.photos.request();
    }

    photosStatus = await Permission.photos.status;

    if (photosStatus.isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? selectedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 30,
      );

      if (selectedImage != null && imageList.length < 10) {
        imageList.add(selectedImage.path);
      }
    } else if (photosStatus.isPermanentlyDenied) {
      Get.dialog(DefaultDialog(
          content: '사진 접근 권한을 허가해주세요',
          onConfirm: () {
            Get.back();
            openAppSettings();
          }));
    } else if (photosStatus.isDenied) {
      Get.dialog(DefaultDialog(
          content: '사진 접근 권한을 허가해주세요',
          onConfirm: () async {
            Get.back();
            await Permission.photos.request();
          }));
    } else if (photosStatus.isRestricted) {
      Get.dialog(DefaultDialog(
          content: '사진 접근 권한을 허가해주세요',
          onConfirm: () async {
            Get.back();
            openAppSettings();
          }));
    } else if (photosStatus.isLimited) {
      final ImagePicker picker = ImagePicker();
      final XFile? selectedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 30,
      );

      if (selectedImage != null && imageList.length < 10) {
        imageList.add(selectedImage.path);
      }
    }
  }

  void deleteImage(int index) => imageList.removeAt(index);

  Future<void> createPost() async {
    UserModel? currentUser = await _userDataSource.getUserFromPreferences();

    PostModel newPost = PostModel(
        userId: currentUser!.id,
        category: selectedCategory.value!,
        title: postTitle.value!,
        content: postContent.value!,
        imageUrls: imageList);

    await _postDataSource.createPost(newPost);
  }
}
