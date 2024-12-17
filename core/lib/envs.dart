class Env {
  static const environment = 'environment';
  static const developmentMode = 'developmentMode';
  static const baseApiLayer = 'baseApiLayer';
  static const baseGraphQLUrl = 'baseGraphQLUrl';
  static const graphqlSocketUrl = 'graphqlSocketUrl';
  static const graphqlApiKey = 'graphqlApiKey';
  static const onesignalAppID = 'onesignalAppID';
  static const app = 'platform';

  /// [customer/user]
  ///
  /// customer: can login to customer app
  ///
  /// user: can login to platform staff, admin, crm, ...
  static const platformRole = 'platformRole';

  static const devEnvName = 'Development';
  static const stagingEnvName = 'Staging';
  static const prodEnvName = 'Production';
  static const demoEnvName = 'Demo';
  static const staffAppName = 'staff';
  static const customerAppName = 'customer';
}
