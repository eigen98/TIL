package aop.clone.delivery.practiceMVVM.util.mapper

import android.view.LayoutInflater
import android.view.ViewGroup
import aop.clone.delivery.practiceMVVM.databinding.*
import aop.clone.delivery.practiceMVVM.model.CellType
import aop.clone.delivery.practiceMVVM.model.Model
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import aop.clone.delivery.practiceMVVM.util.provider.ResourcesProvider
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.ModelViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.food.FoodMenuViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.order.OrderMenuViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.order.OrderViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.restaurant.LikeRestaurantViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.restaurant.RestaurantViewHolder
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.review.RestaurantReviewViewHolder

object ModelViewHolderMapper {

    @Suppress("UNCHECKED_CAST")
    fun <M: Model> map(
        parent: ViewGroup,
        type: CellType,
        viewModel: BaseViewModel,
        resourcesProvider: ResourcesProvider
    ): ModelViewHolder<M> {
        val inflater = LayoutInflater.from(parent.context)
        val viewHolder = when (type) {
            CellType.RESTAURANT_CELL ->
                RestaurantViewHolder(
                    ViewholderRestaurantBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            CellType.LIKE_RESTAURANT_CELL ->
                LikeRestaurantViewHolder(
                    ViewholderLikeRestaurantBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            CellType.FOOD_CELL ->
                FoodMenuViewHolder(
                    ViewholderFoodMenuBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            CellType.ORDER_FOOD_CELL ->
                OrderMenuViewHolder(
                    ViewholderOrderMenuBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            CellType.REVIEW_CELL -> {
                RestaurantReviewViewHolder(
                    ViewholderRestaurantReviewBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            }
            CellType.ORDER_CELL -> {
                OrderViewHolder(
                    ViewholderOrderBinding.inflate(inflater, parent, false),
                    viewModel,
                    resourcesProvider
                )
            }
        }

        return viewHolder as ModelViewHolder<M>
    }

}
