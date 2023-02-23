class EndPoints {
  static const String LOGIN = 'Login/SignIn';
  static const String GET_CATEGORIES =
      'Category/GetAllCategories?CompanyId=1015';
  static const String GET_BRANDS = 'Brand/GetAllBrands?CompanyId=1015&LangId=1';
  static String getAllProducts(String username, String langId) {
    return 'Product/RetriveAllProducts?username=$username&LangId=$langId';
  }

  static String getProductDetails(String username, String productId) {
    return 'Product/RetriveAllProducts?username=$username&ProductId=$productId&LangId=1';
  }

  static String uploadPhoto(String productId) {
    return 'Photo/UploadProductImage?productID=$productId&companyID=1015&CompanyId=1015';
  }

  static String ADD_PRODUCT = 'Product/AddProduct';
}
