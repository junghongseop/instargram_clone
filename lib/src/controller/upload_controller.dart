import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadController extends GetxController {

  RxList<AssetPathEntity> albums = <AssetPathEntity>[].obs;
  RxString headerTitle = ''.obs;
  var imageList = <AssetEntity>[];
  Rx<AssetEntity> selectedImage = AssetEntity(
    id: '0',
    typeInt: 0,
    width: 0,
    height: 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadPhotos();
  }
  void _loadPhotos() async {
    var result = await PhotoManager.requestPermissionExtend();

    if (result.isAuth) {
      var listData = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(
              maxHeight: 100,
              minWidth: 100,
            ),
          ),
          orders: [
            const OrderOption(
              type: OrderOptionType.createDate,
              asc: false,
            ),
          ],
        ),
      );
      albums.addAll(listData);
      _loadData();
    } else {
      // manage 권한 요청
    }
  }

  void _loadData() async {
    headerTitle(albums.first.name);
    await _pagingPhotos();
    // update();
  }

  Future<void> _pagingPhotos() async {
    var photos = await albums.first.getAssetListPaged(0, 30);
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }
}