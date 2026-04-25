import 'package:injectable/injectable.dart';
import 'package:products_app/data/data_sources/local/favorites/favorites_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const _key = 'favorites';

  @override
  Future<Set<int>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.map(int.parse).toSet();
  }

  @override
  Future<void> saveFavorites(Set<int> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _key,
      ids.map((e) => e.toString()).toList(),
    );
  }
}
