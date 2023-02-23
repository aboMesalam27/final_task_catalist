



import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';

Widget customLoading() {
  return Center(
    child: SizedBox(
      height: 30.h,
      width: 30.w,
      child: const CircularProgressIndicator(
        color: AppColors.teal,
        strokeWidth: 2,
      ),
    ),
  );
}
