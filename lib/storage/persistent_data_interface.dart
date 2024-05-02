abstract class IPersistentData<T> {
  void saveData(T value, {String? key});
  Future<void> loadData({String? key});
}
