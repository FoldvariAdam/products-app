abstract class FavoritesLocalDataSource {
  Future<Set<int>> getFavorites();
  Future<void> saveFavorites(Set<int> ids);
}
