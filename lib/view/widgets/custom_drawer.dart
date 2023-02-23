import 'package:final_task_catalist/core/theme/colors.dart';
import 'package:final_task_catalist/shared/network/local/cashe_helper.dart';

import '../../shared/index_shared.dart';
import 'custom_icon_close.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final String userEmail = CacheHelper.getData(key: 'userEmail');
  final String userPhone = CacheHelper.getData(key: 'userPhone');
  final String username = CacheHelper.getData(key: 'userName');
  final String userImage = CacheHelper.getData(key: 'userImage');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            const IconCancelWidget(),
            SizedBox(
              height: 18.h,
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.teal.withOpacity(0.2),
                  radius: 50.r,
                  child: Image.network(
                    'https://newcstorev2api.catalist-me.com/$userImage',
                    height: 50.h,
                  ),
                ),
                Text(
                  'Hi! $username',
                ),
                Text(
                  userEmail,
                ),
                Text(
                  userPhone,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
