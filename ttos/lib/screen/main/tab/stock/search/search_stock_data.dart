import 'package:get/get.dart';
import 'package:ttos/common/util/local_json.dart';
import 'package:ttos/screen/main/tab/stock/tab/vo/vo_simple_stock.dart';

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteListe = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();

    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList =
        await LocalJson.getObjectList<SimpleStock>('stock_list.json');
    stocks.addAll(jsonList);
  }
}
