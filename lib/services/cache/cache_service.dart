import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:cached_storage/cached_storage.dart';

class CacheService {
  static Future<void> init()async{
    CachedQuery.instance.configFlutter(
      config: GlobalQueryConfig(
        refetchOnConnection: true,
        refetchOnResume: true,
      ),
      storage: await CachedStorage.ensureInitialized(),
    );
  }
}