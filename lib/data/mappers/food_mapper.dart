import 'package:personal_hub_app/data/dtos/food_dto.dart';
import 'package:personal_hub_app/data/mappers/nutition_mapper.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';

/// Mapper for [FoodAutoFillDto] <-> [FoodAutoFillEntity]
extension FoodAutoFillDtoMapper on FoodAutoFillDto {
  FoodAutoFillEntity toEntity() {
    return FoodAutoFillEntity(
      id: id,
      name: name,
      type: type,
    );
  }
}

/// Mapper for [FoodProductDto] <-> [FoodProductEntity]
extension FoodProductDtoMapper on FoodProductDto {
  FoodProductEntity toEntity() {
    return FoodProductEntity(
      id: id,
      name: name,
      nutrition: nutrition.toEntity(),
      barcode: barcode,
      quantity: quantity ?? '',
      brand: brand ?? '',
    );
  }
}

