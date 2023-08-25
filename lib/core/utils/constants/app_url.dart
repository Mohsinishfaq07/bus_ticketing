class AppUrl {
  static const String baseUrl = 'http://20.212.227.60:3018/api/v1';
  // static const String baseUrl = 'http://192.168.4.136:3018/api/v1';
  // static const String baseUrl = 'http://192.168.100.151:3018/api/v1';

  static const String loginUrl = '/auth/logIn';
  static const String signupUrl = '/auth/signUp';
  static const String forgetPasswordUrl = '/auth/logIn';

  /// Ticket
  static const String generateTicketForRegisteredUserUrl = '/cardTransaction';
  static const String generateTicketForUnRegisteredUserUrl = '/openTicket';
  static const String addBalanceUrl = '/userTransaction';

  /// user
  static const String registerCardAgainstUserUrl = '/card/cardNo';
  static const String getUserCardDetailsUrl = '/card/cardNo';
  static const String getUserHistoryUrl = '/userTransaction';
  static const String linkCardUrl = '/card/link';
  static const String getCardByCardHolderUrl = '/card/cardHolder';
}
