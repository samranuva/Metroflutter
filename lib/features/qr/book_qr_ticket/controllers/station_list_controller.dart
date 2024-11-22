import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_savaari/data/repositories/book_qr/station_list_repository.dart';
import 'package:t_savaari/features/qr/book_qr_ticket/models/station_list_model.dart';
import 'package:t_savaari/utils/popups/loaders.dart';


class StationListController extends GetxController {
  static StationListController get instance => Get.find();

  //Variables
  final isLoading = true.obs;
  final stationListRepository = Get.put(StationListRepository());
  final deviceStorage = GetStorage();
  final RxList<StationListModel> stationList = <StationListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getStationList();
  }

  Future<void> getStationList() async {
    try {
      //Show loader while loading categories
      isLoading.value = true;
      final token = await deviceStorage.read('access_token');
      if (token != null) {
        final stationsData =
            await stationListRepository.fetchStationList(token);
        stationList
            .assignAll(stationsData.stations as Iterable<StationListModel>);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }
}
