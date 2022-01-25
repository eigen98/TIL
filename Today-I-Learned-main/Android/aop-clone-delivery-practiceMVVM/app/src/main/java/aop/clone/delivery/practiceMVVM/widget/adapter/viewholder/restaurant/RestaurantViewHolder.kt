package aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.restaurant

import aop.clone.delivery.practiceMVVM.databinding.ViewholderRestaurantBinding
import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantModel
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import aop.clone.delivery.practiceMVVM.util.provider.ResourcesProvider
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.restaurant.RestaurantListListener
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.ModelViewHolder

class RestaurantViewHolder(
    private val binding: ViewholderRestaurantBinding,
    viewModel: BaseViewModel,
    resourcesProvider: ResourcesProvider
): ModelViewHolder<RestaurantModel>(binding, viewModel, resourcesProvider) {

    override fun reset() = with(binding) {
        restaurantImage.clear()
    }

    override fun bindData(model: RestaurantModel) {
        super.bindData(model)
        with(binding) {
            restaurantImage.load(model.restaurantImageUrl, 24f)
            restaurantTitleText.text = model.restaurantTitle
            gradeText.text = resourcesProvider.getString(R.string.grade_format, model.grade)
            reviewCountText.text = resourcesProvider.getString(R.string.review_count, model.reviewCount)
            val (minTime, maxTime) = model.deliveryTimeRange
            deliveryTimeText.text = resourcesProvider.getString(R.string.delivery_time, minTime, maxTime)

            val (minTip, maxTip) = model.deliveryTipRange
            deliveryTipText.text = resourcesProvider.getString(R.string.delivery_tip, minTip, maxTip)
        }
    }

    override fun bindViews(model: RestaurantModel, adapterListener: AdapterListener) = with(binding) {
        if (adapterListener is RestaurantListListener) {
            root.setOnClickListener {
                adapterListener.onClickItem(model)
            }
        }
    }

}
