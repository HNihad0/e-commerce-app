class Endpoints {
  Endpoints._();

  static const String _productsURL = 'https://fakestoreapi.com'; //Products API URL
  static const String products = '$_productsURL/products';
  static const String productCategories = '$_productsURL/products/categories';




  static const String _authURL = 'http://134.122.65.76:8080/api'; // Auth API URL
  static const String verifyEmail = '$_authURL/user/verifyEmail';

  static const String register = '$_authURL/user/register';

  static const String login = '$_authURL/auth/login';
  static const String logout = '$_authURL/auth/logout';
}
