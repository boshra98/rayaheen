class AppLink {

  static const String server = "http://192.168.43.34:8000/api";



  static const String imagestatic = "http://192.168.43.34:8000/storage";
  static const String imagesCategories = "http://192.168.43.34:8000/storage";
  static const String imagesItems = "http://192.168.43.34:8000/storage";



//
  //static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/register";
  static const String login = "$server/login";
  //static const String verifycodessignup = "$server/verify-email";
  //static const String resend ="$server/verify-email";


// ================================= ForgetPassword ========================== //


  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

  static const String homepage = "$server/category";
  static const String items = "$server/items";
  static const String searchitems = "$server/searchitems";

  static const String favoriteAdd = "$server/addfavorite";
  static const String favoriteRemove = "$server/removefavorites";
  static const String favoriteView = "$server/viewfavorites";
  static const String deletefromfavroite =
      "$server/deleteitemfavorites";


  // Address

  static const String addressView = "server/address/view.php";
  static const String addressAdd = "server/address/add.php";
  static const String addressEdit = "server/address/edit.php";
  static const String addressDelete = "server/address/delete.php";


  // Cart
  static const String cartview = "$server/cart";
  static const String cartadd = "$server/addtocart";
  static const String cartdelete = "$server/removecart";
  static const String cartgetcountitems = "$server/getcountitems";

  // Coupon

  static const String checkcoupon  = "server/coupon/checkcoupon.php";

  // Checkout

  static const String checkout  = "$server/order";

  static const String pendingorders  = "$server/allorders";
  static const String ordersarchive  = "$server/ordersarchive";
  static const String ordersdetails  = "$server/ordersdetails";
  static const String ordersdelete  = "$server/deleteorder";
  static const String notification = "/notification.php";





}