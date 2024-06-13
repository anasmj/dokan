class Endpoints {
  static const registration = 'wp-json/wp/v2/users/register';
  static String update(int id) => 'wp-json/wp/v2/users/$id';
  static const login = 'wp-json/jwt-auth/v1/token';
}
