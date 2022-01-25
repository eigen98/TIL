package aop.clone.delivery.practiceMVVM.widget.adapter.listener.restaurant

import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantModel

interface RestaurantLikeListListener: RestaurantListListener {

    fun onDislikeItem(model: RestaurantModel)

}
