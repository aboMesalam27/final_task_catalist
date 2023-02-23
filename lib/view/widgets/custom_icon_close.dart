import '../../shared/index_shared.dart';

class IconCancelWidget extends StatelessWidget {
  const IconCancelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 30.h),
          child: Icon(
            Icons.close,
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}