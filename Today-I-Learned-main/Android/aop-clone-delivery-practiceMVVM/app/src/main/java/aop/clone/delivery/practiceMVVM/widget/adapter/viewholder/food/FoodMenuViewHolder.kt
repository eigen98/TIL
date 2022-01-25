package aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.food

import aop.clone.delivery.practiceMVVM.databinding.ViewholderFoodMenuBinding
import aop.clone.delivery.practiceMVVM.model.restaurant.FoodModel
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import aop.clone.delivery.practiceMVVM.util.provider.ResourcesProvider
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.restaurant.FoodMenuListListener
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.ModelViewHolder

class FoodMenuViewHolder(
    private val binding: ViewholderFoodMenuBinding,
    viewModel: BaseViewModel,
    resourcesProvider: ResourcesProvider
): ModelViewHolder<FoodModel>(binding, viewModel, resourcesProvider) {

    override fun reset() = with(binding) {
        foodImage.clear()
    }

    override fun bindData(model: FoodModel) {
        super.bindData(model)
        with(binding) {
            foodImage.load(model.imageUrl, 24f, CenterCrop())
            foodTitleText.text = model.title
            foodDescriptionText.text = model.description
            priceText.text = resourcesProvider.getString(R.string.price, model.price)
        }
    }

    override fun bindViews(model: FoodModel, adapterListener: AdapterListener) {
        if (adapterListener is FoodMenuListListener) {
            binding.root.setOnClickListener {
                adapterListener.onClickItem(model)
            }
        }
    }

}
