package aop.clone.delivery.practiceMVVM.model.restaurant

import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantFoodEntity
import aop.clone.delivery.practiceMVVM.model.CellType
import aop.clone.delivery.practiceMVVM.model.Model

data class FoodModel(
    override val id: Long,
    override val type: CellType = CellType.FOOD_CELL,
    val title: String,
    val description: String,
    val price: Int,
    val imageUrl: String,
    val restaurantId: Long,
    val foodId: String,
    val restaurantTitle: String
) : Model(id, type) {

    fun toEntity(basketIndex: Int) = RestaurantFoodEntity(
        "${foodId}_${basketIndex}", title, description, price, imageUrl, restaurantId, restaurantTitle
    )

}
