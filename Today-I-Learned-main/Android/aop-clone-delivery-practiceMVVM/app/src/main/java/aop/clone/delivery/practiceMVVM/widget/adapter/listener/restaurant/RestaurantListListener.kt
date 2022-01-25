package aop.clone.delivery.practiceMVVM.widget.adapter.listener.restaurant

import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantModel
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener

interface RestaurantListListener: AdapterListener {

    fun onClickItem(model: RestaurantModel)

}
