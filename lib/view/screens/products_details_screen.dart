import '../controller/product_details/index_product_details.dart';

import '../widgets/index_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  final String userName;

  const ProductDetailsScreen(
      {super.key, required this.productId, required this.userName});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, isBack: true, title: AppText.productDetails),
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (_) => ProductDetailsCubit()
          ..getProductDetails(
              productId: widget.productId, userName: widget.userName),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
          builder: (context, state) {
            if (state is ProductDetailsSuccessState) {
              var product = state.productDetailsModel.response!.products![0];
              return SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15.r,
                            color: const Color.fromRGBO(0, 0, 0, 0.05))
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://newcstorev2api.catalist-me.com/${(product.photoPath)?.replaceAll(r'\', r'/')}',
                          placeholder: (context, url) => LoadingImageContainer(
                            width: double.infinity.w,
                            height: 130.h,
                          ),
                          errorWidget: (context, url, error) =>
                              LoadingImageContainer(
                            width: double.infinity.w,
                            height: 130.h,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Name : ${product.productName!}",
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Category : ${product.categoryName}",
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          "Brand : ${product.brandName}",
                        ),
                      ],
                    ),
                  ),
                ],
              ));
            } else {
              return customLoading();
            }
          },
        ),
      ),
    );
  }
}
