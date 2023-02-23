

import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';

PreferredSizeWidget customAppBar(
    {String? title, bool? isCenter, required context, required bool isBack}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.teal,
    title: Text(title ?? ''),
    centerTitle: isCenter ?? false,
    leading: isBack
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          )
        : const Text(''),
  );
}
