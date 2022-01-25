package aop.clone.delivery.practiceMVVM.data.entity.order

import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantFoodEntity

data class OrderEntity(
    val id: String,
    val userId: String,
    val restaurantId: Long,
    val foodMenuList: List<RestaurantFoodEntity>,
    val restaurantTitle: String
)
