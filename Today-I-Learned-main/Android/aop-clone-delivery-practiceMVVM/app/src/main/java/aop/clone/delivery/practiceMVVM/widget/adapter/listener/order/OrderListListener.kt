package aop.clone.delivery.practiceMVVM.widget.adapter.listener.order

import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener

interface OrderListListener: AdapterListener {

    fun writeRestaurantReview(orderId: String, restaurantTitle: String)

}
