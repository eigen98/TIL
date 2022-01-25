package aop.clone.delivery.practiceMVVM.widget.adapter.listener.restaurant

import aop.clone.delivery.practiceMVVM.model.restaurant.FoodModel
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener

interface FoodMenuListListener: AdapterListener {

    fun onClickItem(model: FoodModel)

}
