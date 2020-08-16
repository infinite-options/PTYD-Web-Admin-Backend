namespace InfiniteMeals.Model.Login {
    public static class SocialMediaLoginConstants {
        public static string AppName = "PTYD";

        // Google OAuth
        // For Google login, configure at https://console.developers.google.com/
        public static string GoogleiOSClientId = "333899878721-8b28op1ce803f7ohta381qsokg52pr37.apps.googleusercontent.com";
        public static string GoogleAndroidClientId = "333899878721-66umetvrt811gvqu9fn7odge1bq6or3d.apps.googleusercontent.com";

        // These values do not need changing
        public static string GoogleScope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";
        public static string GoogleAuthorizeUrl = "https://accounts.google.com/o/oauth2/auth";
        public static string GoogleAccessTokenUrl = "https://www.googleapis.com/oauth2/v4/token";
        public static string GoogleUserInfoUrl = "https://www.googleapis.com/oauth2/v2/userinfo";

        // Set these to reversed iOS/Android client ids, with :/oauth2redirect appended
        public static string GoogleiOSRedirectUrl = "com.googleusercontent.apps.333899878721-8b28op1ce803f7ohta381qsokg52pr37:/oauth2redirect";
        public static string GoogleAndroidRedirectUrl = "com.googleusercontent.apps.333899878721-66umetvrt811gvqu9fn7odge1bq6or3d:/oauth2redirect";

        //-------------------------------------------------------------------------------------------------------

        // Facebook OAuth TODO facebook login
        // For Facebook login, configure at https://developers.facebook.com
        public static string FacebookiOSClientId = "508721976476931";
        public static string FacebookAndroidClientId = "508721976476931"; 

        // These values do not need changing
        public static string FacebookScope = "email";
        public static string FacebookAuthorizeUrl = "https://www.facebook.com/dialog/oauth/";
        public static string FacebookAccessTokenUrl = "https://www.facebook.com/connect/login_success.html";
        public static string FacebookUserInfoUrl = "https://graph.facebook.com/me?fields=email&access_token={accessToken}";

        // Set these to reversed iOS/Android client ids, with :/oauth2redirect appended
        public static string FacebookiOSRedirectUrl = "139674679127805:/oauth2redirect";
        public static string FacebookAndroidRedirectUrl = "https://www.facebook.com/connect/login_success.html"; 
    }
}
