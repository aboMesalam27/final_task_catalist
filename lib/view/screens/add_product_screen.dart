import 'package:final_task_catalist/view/controller/add_product/index_add_product.dart';
import '../widgets/index_widgets.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();

  final TextEditingController skuController = TextEditingController();
  String? brandId;

  String? categoryId;
  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            title: const Text(AppText.chooseMedia),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.image),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const Text(AppText.fromGallery),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.camera),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const Text(AppText.fromCamera),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(
              context: context,
              isBack: true,
              title: AppText.addProduct,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultTextFiled(
                      hintText: AppText.productName,
                      readOnly: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: productNameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DefaultTextFiled(
                      readOnly: false,
                      controller: skuController,
                      hintText: AppText.sku,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CategoriesComponents(onChanged: (v) {
                      categoryId = v;
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    BrandsComponents(onChanged: (v) {
                      brandId = v;
                    }),
                    SizedBox(
                      height: 40.h,
                    ),
                    PrimaryButton(
                      text: AppText.uploadPhoto,
                      onPressed: () {
                        myAlert();
                      },
                      btnColor: AppColors.teal,
                      borderSide: const BorderSide(color: AppColors.teal),
                      textStyle: const TextStyle(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    image != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                //to show image, you type like this.
                                File(image!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          )
                        : const Text(
                            ' noImageFoun',
                            style: TextStyle(fontSize: 20),
                          ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ConditionalBuilder(
                      builder: (context) {
                        return PrimaryButton(
                            width: 260.w,
                            height: 44.h,
                            textStyle: const TextStyle(color: AppColors.white),
                            borderSide: const BorderSide(
                              color: AppColors.teal,
                            ),
                            btnColor: AppColors.teal,
                            text: AppText.addProduct,
                            onPressed: () {

                              AddProductCubit.get(context).addProduct(
                                  brandID: brandId!,
                                  categoryID: categoryId!,
                                  productName: productNameController.text,
                                  sukName: skuController.text,
                                  context: context,
                                  file: image!,
                                  productId: 7765.toString());

                            });
                      },
                      condition: state is! AddProductLoadingState,
                      fallback: (context) => customLoading(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AddProductSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.homeScreen, (route) => false);
          }
        },
      ),
    );
  }
}
