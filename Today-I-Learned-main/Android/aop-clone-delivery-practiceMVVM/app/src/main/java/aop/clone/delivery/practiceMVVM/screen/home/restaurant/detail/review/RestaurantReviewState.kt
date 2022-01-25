package aop.clone.delivery.practiceMVVM.screen.home.restaurant.detail.review

import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantReviewModel

sealed class RestaurantReviewState {

    object Uninitialized: RestaurantReviewState()

    object Loading: RestaurantReviewState()

    data class Success(
        val reviewList: List<RestaurantReviewModel>
    ): RestaurantReviewState()

}
