const baseUrl = 'http://apptest.dokandemo.com';

//ENDPOINTS
///registration
const registraionUrl = 'wp-json/wp/v2/users/register';
const loginUrl = 'wp-json/jwt-auth/v1/token';

final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
