import 'package:flutter/cupertino%202.dart';
import 'package:pixabay_image/data/pixabay.dart';

import '../../data/pixarbay_repository.dart';

class SearchViewModel with ChangeNotifier {
  List<Pixabay> images = [];
  int tagIndex = 0;
  final _api = PixabayRepository();

  // hero tag index 설정
  void setTagIndex(index) {
    tagIndex = index;
    notifyListeners();
  }

  // 리턴 타입이 있으면 사진 안나옴
  Future<List<Pixabay>> getImages(String keyword) async {
    if (keyword.isEmpty) {
      images.clear();
      notifyListeners();
      return images;
    }
    images = await _api.getPixabays(keyword);
    notifyListeners();
    return images;
  }
}
