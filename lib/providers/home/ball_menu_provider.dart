import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/ball_menu_model.dart';

class BallMenuNotifier extends StateNotifier<List<BallMenuModel>> {
  BallMenuNotifier() : super([]);

  Future<void> fetchAndSetMenus() async {
    // const url = 'http://47.108.129.252:3000/homepage/dragon/ball';
    const url =
        'https://flutter-music-catsriver-default-rtdb.firebaseio.com/menus.json';

    try {
      final response = await Dio().get(url);

      final extractedData = response.data['data'];
      final List<BallMenuModel> loadedMenus = [];

      for (var menu in extractedData) {
        loadedMenus.add(BallMenuModel.fromJson(menu));
      }

      state = loadedMenus;
    } catch (err) {
      rethrow;
    }
  }
}

final ballMenuProvider =
    StateNotifierProvider<BallMenuNotifier, List<BallMenuModel>>(
        (ref) => BallMenuNotifier());
