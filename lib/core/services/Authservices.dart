import 'package:shared_preferences/shared_preferences.dart';


//Saving Login State:
class AuthService {
  Future<void> login(String token) async {
    // Save the token to shared preferences when user logs in
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> logout() async {
    // Remove the token when the user logs out
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Check if a token exists (i.e., user is logged in)
    String? token = prefs.getString('auth_token');
    return token != null;
  }
}
