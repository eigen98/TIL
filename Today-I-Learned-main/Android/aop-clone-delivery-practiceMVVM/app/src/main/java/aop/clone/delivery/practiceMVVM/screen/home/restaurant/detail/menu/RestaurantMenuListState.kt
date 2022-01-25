package aop.clone.delivery.practiceMVVM.screen.home.restaurant.detail.menu

import aop.clone.delivery.practiceMVVM.model.restaurant.FoodModel

sealed class RestaurantMenuListState {

    object Uninitialized: RestaurantMenuListState()

    object Loading: RestaurantMenuListState()

    data class Success(
        val restaurantFoodModelList: List<FoodModel>? = null
    ): RestaurantMenuListState()

}
