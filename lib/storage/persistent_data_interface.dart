abstract class IPersistentData {
  void saveData<T>(T value, {String? key});
  Future<T> loadData<T>({String? key});
}
