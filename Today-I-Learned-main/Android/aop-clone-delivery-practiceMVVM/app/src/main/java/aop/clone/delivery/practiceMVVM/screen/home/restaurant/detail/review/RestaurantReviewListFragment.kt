package aop.clone.delivery.practiceMVVM.screen.home.restaurant.detail.review

import androidx.core.os.bundleOf
import aop.clone.delivery.practiceMVVM.databinding.FragmentListBinding
import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantReviewModel
import aop.clone.delivery.practiceMVVM.screen.base.BaseFragment
import aop.clone.delivery.practiceMVVM.widget.adapter.ModelRecyclerAdapter
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener
import org.koin.android.viewmodel.ext.android.viewModel
import org.koin.core.parameter.parametersOf

class RestaurantReviewListFragment : BaseFragment<RestaurantReviewListViewModel, FragmentListBinding>() {

    override fun getViewBinding(): FragmentListBinding = FragmentListBinding.inflate(layoutInflater)

    override val viewModel by viewModel<RestaurantReviewListViewModel> {
        parametersOf(
            arguments?.getString(RESTAURANT_TITLE_KEY)
        )
    }

    private val adapter by lazy {
        ModelRecyclerAdapter<RestaurantReviewModel, RestaurantReviewListViewModel>(
            listOf(), viewModel, adapterListener = object : AdapterListener { }
        )
    }

    override fun observeData() = viewModel.reviewStateLiveData.observe(viewLifecycleOwner) {
        when (it) {
            is RestaurantReviewState.Success -> {
                handleSuccess(it)
            }
        }
    }

    override fun initViews() {
        binding.recyclerVIew.adapter = adapter
    }

    private fun handleSuccess(state: RestaurantReviewState.Success) {
        adapter.submitList(state.reviewList)
    }

    companion object {

        const val RESTAURANT_TITLE_KEY = "restaurantTitle"

        fun newInstance(restaurantTitle: String): RestaurantReviewListFragment {
            val bundle = bundleOf(
                RESTAURANT_TITLE_KEY to restaurantTitle
            )
            return RestaurantReviewListFragment().apply {
                arguments = bundle
            }
        }

    }

}
