class AppLink {

  static const String server = "http://192.168.137.233:8000/api";



  static const String imagestatic = "http://192.168.137.233:8000/";
  static const String imagesCategories = "http://192.168.137.233:8000/";
  static const String imagesItems = "http://192.168.137.233:8000/";



//
  //static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/login";
  static const String verifycodessignup = "$server/auth/verfiycode.php";

// ================================= ForgetPassword ========================== //


  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

  static const String homepage = "$server/category";
  static const String items = "$server/items";
  static const String searchitems = "$server/items/search.php";


  static const String favoriteAdd = "server/favorite/add.php";
  static const String favoriteRemove = "server/favorite/remove.php";
  static const String favoriteView = "server/favorite/view.php";
  static const String deletefromfavroite =
      "server/favorite/deletefromfavroite.php";
  // Cart
  static const String cartview = "$server/cart";
  static const String cartadd = "$server/cart";
  static const String cartdelete = "$server/removecart";
  static const String cartgetcountitems = "server/cart/getcountitems.php";



}