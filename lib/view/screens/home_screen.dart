import 'package:final_task_catalist/view/controller/home/index_home.dart';
import 'package:final_task_catalist/view/screens/products_details_screen.dart';

import '../widgets/index_widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = CacheHelper.getData(key: 'userName') ?? '540948992';
  String langId = '1';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..getAllProducts(userName, langId, context),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text(AppText.homeScreen),
          backgroundColor: AppColors.teal,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await HomeCubit().getAllProducts(userName, langId, context);
          },
          child: BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetProductSuccessState) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.h),
                  child: GridView.count(
                    childAspectRatio: 1 / 1.6,
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(state.productsList.length, (index) {
                      return Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsScreen(
                                              productId: state
                                                  .productsList[index].id
                                                  .toString(),
                                              userName: userName,
                                            )));
                              },
                              child: Card(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://newcstorev2api.catalist-me.com/${(state.productsList[index].photoPath)?.replaceAll(r'\', r'/')}',
                                    placeholder: (context, url) =>
                                        LoadingImageContainer(
                                      width: double.infinity.w,
                                      height: 130.h,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        LoadingImageContainer(
                                      width: double.infinity.w,
                                      height: 130.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            state.productsList[index].productName!,
                            style: const TextStyle(color: Colors.teal),
                          )
                        ],
                      );

                      // return buildItemCart(context, index, state, quantity1);
                    }),
                  ),
                );
              } else {
                return customLoading();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.addProduct);
          },
          backgroundColor: AppColors.teal,
          child: Icon(Icons.add, size: 25.sp),
        ),
      ),
    );
  }
}
