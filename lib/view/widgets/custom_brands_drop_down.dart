import 'package:dropdown_button2/dropdown_button2.dart';

import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';
import '../controller/brands/brands_cubit.dart';
import '../controller/brands/brands_state.dart';

class BrandsComponents extends StatefulWidget {
  String? selectBrandId;

  BrandsComponents({super.key, this.selectBrandId});

  @override
  State<BrandsComponents> createState() => _BrandsComponentsState();
}

class _BrandsComponentsState extends State<BrandsComponents> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit()..getBrandsList(context),
      child: BlocBuilder<BrandsCubit, BrandsStates>(
        builder: (context, state) {
          if (state is BrandsSuccessState) {
            return DropdownButtonFormField2(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: AppColors.white,
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade50, width: 2)),
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.grey.withOpacity(0.8)),
                ),
                isDense: true,
                label: widget.selectBrandId != null
                    ? null
                    : const Text(AppText.brands),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black45,
                size: 20,
              ),
              iconSize: 30,
              buttonHeight: 45,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: state.brandsList
                  .map((item) => DropdownMenuItem<String>(
                        onTap: () {
                          setState(() {
                            widget.selectBrandId = item.id.toString();
                          });
                        },
                        value: item.id.toString(),
                        child: Text(
                          item.brandName!,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.selectBrandId = value.toString();
              },
              onSaved: (value) {
                widget.selectBrandId = value.toString();
              },
            );
          } else {
            return customLoading();
          }
        },
      ),
    );
  }
}
