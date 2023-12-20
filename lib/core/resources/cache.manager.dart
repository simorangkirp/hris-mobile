import '../../lib.dart';

mixin CacheManager {
  Future<String> accessToken() async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    return header;
  }

  Future<String> userUID() async {
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var uid = mods?.uid ?? "-";
    return uid;
  }
}
