enum Flavor {
  production,
  staging,
  development,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? "";

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return "Revo Garage";
      case Flavor.staging:
        return "Revo Garage";
      case Flavor.development:
        return "Revo Garage";
      // ignore: no_default_cases
      default:
        return "title";
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return "https://api.revo-garage.com";
      case Flavor.staging:
        return "https://api-test.revo-garage.com";
      case Flavor.development:
        return "https://api-test.revo-garage.com";
      // ignore: no_default_cases
      default:
        return "https://api-test.revo-garage.com";
    }
  }
}
