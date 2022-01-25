package aop.clone.delivery.practiceMVVM.widget.adapter.listener.order

import aop.clone.delivery.practiceMVVM.model.restaurant.FoodModel
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener

interface OrderMenuListListener: AdapterListener {

    fun onRemoveItem(model: FoodModel)

}
