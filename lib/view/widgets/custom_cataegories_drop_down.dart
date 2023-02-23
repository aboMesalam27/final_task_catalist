import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:final_task_catalist/view/controller/categories/categories_cubit.dart';

import '../../core/theme/colors.dart';
import '../../shared/index_shared.dart';
import '../controller/categories/categories_state.dart';

class CategoriesComponents extends StatefulWidget {
  CategoriesComponents({Key? key,this.selectCategoryId}) : super(key: key);
  String? selectCategoryId;

  @override
  State<CategoriesComponents> createState() => _CategoriesComponentsState();
}

class _CategoriesComponentsState extends State<CategoriesComponents> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getCategoriesList(context),
      child: BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
          if (state is CategoriesSuccessState) {
            return DropdownButtonFormField2(
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
                label: widget.selectCategoryId != null
                    ? null
                    : const Text(AppText.categories),
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
              items: state.categoriesList
                  .map((item) => DropdownMenuItem<String>(
                        onTap: () {
                         setState(() {
                           widget.selectCategoryId = item.id.toString();
                         });
                        },
                        value: item.id.toString(),
                        child: Text(
                          item.categoryname!,
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.selectCategoryId = value.toString();
              },
              onSaved: (value) {
                widget.selectCategoryId = value.toString();
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
