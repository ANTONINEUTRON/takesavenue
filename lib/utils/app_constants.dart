class AppConstants {
  static final appName = "Takes Avenue";
  static final description =
      "Fun, Healthy Banter"; // Maling banter a rewarding experience

  static final String baseUrl ="https://takesavenue-backend.vercel.app/api";
      // "http://10.0.2.2:3000/api"; //

  static final String userUrl = "$baseUrl/user";

  static final String userTakesUrl = "$baseUrl/user/takes";

  static final String loginWithGoogleUrl = "$baseUrl/login/google";

  static final String loginUrl = "$baseUrl/login";

  static final String takesUrl = "$baseUrl/takes";

  static String leaderboardUrl = "$baseUrl/users";

  static String getUser(String id) => "$baseUrl/users/$id";
}
