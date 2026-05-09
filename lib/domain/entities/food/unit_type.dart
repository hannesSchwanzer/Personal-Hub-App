enum UnitType {
  miligrams,
  grams,
  kilograms,
  ounces,
  pounds,
  milliliters,
  liters,
  fluidOunces,
  gallons,
  pieces,
  teaspoons,
  tablespoons,
  centimeters,
  pinches;

  String get abbreviation {
    switch (this) {
      case UnitType.miligrams:
        return 'mg';
      case UnitType.grams:
        return 'g';
      case UnitType.kilograms:
        return 'kg';
      case UnitType.ounces:
        return 'oz';
      case UnitType.pounds:
        return 'lb';
      case UnitType.milliliters:
        return 'ml';
      case UnitType.liters:
        return 'l';
      case UnitType.fluidOunces:
        return 'fl oz';
      case UnitType.gallons:
        return 'gal';
      case UnitType.pieces:
        return 'pc';
      case UnitType.teaspoons:
        return 'tsp';
      case UnitType.tablespoons:
        return 'tbsp';
      case UnitType.centimeters:
        return 'cm';
      case UnitType.pinches:
        return 'pinch';
    }
  }

  @override
  String toString() => abbreviation;

  /// Creates a UnitType from abbreviation or name (case-insensitive)
  static UnitType? fromString(String value) {
    final val = value.trim().toLowerCase();
    for (var type in UnitType.values) {
      if (type.name.toLowerCase() == val ||
          type.abbreviation.toLowerCase() == val) {
        return type;
      }
    }
    // Special case for plural abbreviations and common variations
    switch (val) {
      case 'miligrams':
      case 'miligram':
      case 'milligrams':
      case 'milligram':
      case 'mg':
      case 'mgs':
        return UnitType.miligrams;
      case 'grams':
      case 'gram':
      case 'g':
      case 'gs':
        return UnitType.grams;
      case 'kilograms':
      case 'kilogram':
      case 'kg':
      case 'kgs':
        return UnitType.kilograms;
      case 'ounces':
      case 'ounce':
      case 'oz':
      case 'ozs':
        return UnitType.ounces;
      case 'pounds':
      case 'pound':
      case 'lb':
      case 'lbs':
        return UnitType.pounds;
      case 'milliliters':
      case 'milliliter':
      case 'ml':
      case 'mls':
        return UnitType.milliliters;
      case 'liters':
      case 'liter':
      case 'l':
      case 'ls':
        return UnitType.liters;
      case 'fluidounces':
      case 'fluidounce':
      case 'fl':
      case 'floz':
      case 'fl oz':
      case 'fl. oz.':
      case 'fl.oz':
        return UnitType.fluidOunces;
      case 'gallons':
      case 'gallon':
      case 'gal':
      case 'gals':
        return UnitType.gallons;
      case 'pieces':
      case 'piece':
      case 'pc':
      case 'pcs':
        return UnitType.pieces;
      case 'teaspoons':
      case 'teaspoon':
      case 'tsp':
      case 'tsps':
        return UnitType.teaspoons;
      case 'tablespoons':
      case 'tablespoon':
      case 'tbsp':
      case 'tbsps':
        return UnitType.tablespoons;
      case 'centimeters':
      case 'centimeter':
      case 'cm':
        return UnitType.centimeters;
      case 'pinches':
      case 'pinch':
        return UnitType.pinches;
      default:
        return null;
    }
  }
}

