
import 'package:personal_hub_app/data/dtos/nutrition_dto.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';

extension NutritionDtoMapper on NutritionDto {
  NutritionEntity toEntity() {
    return NutritionEntity(
      energyKcal: energyKcal,
      carbohydrates: carbohydrates,
      proteins: proteins,
      fat: fat,
      sugars: sugars,
      saturatedFat: saturatedFat,
      sodium: sodium,
      quantityUnit: quantityUnit,
      perQuantity: perQuantity,
    );
  }
}
