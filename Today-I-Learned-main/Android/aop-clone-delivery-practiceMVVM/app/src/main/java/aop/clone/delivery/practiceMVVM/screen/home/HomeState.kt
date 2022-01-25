package aop.clone.delivery.practiceMVVM.screen.home

import androidx.annotation.StringRes
import aop.clone.delivery.practiceMVVM.data.entity.locaion.MapSearchInfoEntity
import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantFoodEntity

sealed class HomeState {

    object Uninitialized: HomeState()

    object Loading: HomeState()

    data class Success(
        val mapSearchInfoEntity: MapSearchInfoEntity,
        val isLocationSame: Boolean,
        val foodMenuListInBasket: List<RestaurantFoodEntity>? = null
    ): HomeState()

    data class Error(
        @StringRes val messageId: Int
    ): HomeState()

}
