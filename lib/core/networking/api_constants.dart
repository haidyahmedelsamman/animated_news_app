class ApiConstants {
  static const String apiBaseUrl = "https://newsapi.org/v2/";
  static const String topHeadlinesNews = "top-headlines";
  static const String sourcesTitle = "top-headlines/sources";
  static const String everyThing = "everything";
  static const String apiKey = "64d8506675ed4c3a9fe183c9600cfa71";
  static const String country = "us";

  //https://newsapi.org/v2/everything?apiKey=52774902d8ac4897844ba549c4cc95b2&q=health&sources=abc-news
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
