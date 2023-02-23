import '../../shared/network/local/cashe_helper.dart';

bool isNewUser = CacheHelper.getData(key: 'isNewUser') ?? false;
