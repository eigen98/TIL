package com.example.shopping.presentation.list

import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.view.isGone
import com.example.shopping.databinding.FragmentProductListBinding
import com.example.shopping.databinding.FragmentProfileBinding
import com.example.shopping.extensions.toast
import com.example.shopping.presentation.BaseFragment
import com.example.shopping.presentation.adapter.ProductListAdapter
import com.example.shopping.presentation.detail.ProductDetailActivity
import com.example.shopping.presentation.main.MainActivity
import com.example.shopping.presentation.profile.ProfileViewModel
import org.koin.android.ext.android.inject

internal class ProductListFragment : BaseFragment<ProductListViewModel,FragmentProductListBinding>() {

    companion object{
        const val TAG = "ProductListFragment"
    }

    //뷰모델 추가
    override val viewModel: ProductListViewModel by inject<ProductListViewModel>()

    //뷰바인딩 추가
    override fun getViewBinding(): FragmentProductListBinding = FragmentProductListBinding.inflate(layoutInflater)

    //어답터 추가
    private val adapter = ProductListAdapter()

    private val startProductDetailForResult =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result: ActivityResult ->
            // TODO 성공적으로 처리 완료 이후 동작
            if (result.resultCode == ProductDetailActivity.PRODUCT_ORDERED_RESULT_CODE) {
                (requireActivity() as MainActivity).viewModel.refreshOrderList()
            }
        }


    override fun observeData() {
        //상태에 따라서 처리
        viewModel.productListStateLiveData.observe(this) {
            when (it) {
                is ProductListState.UnInitialized -> {
                    initViews(binding)
                }
                is ProductListState.Loading -> {
                    handleLoadingState()
                }
                is ProductListState.Success -> {
                    handleSuccessState(it)
                }
                is ProductListState.Error -> {
                    handleErrorState()
                }
            }
        }
    }

    //어댑터와 새로고침 상태 이벤트 리스너 장착
    private fun initViews(binding: FragmentProductListBinding) = with(binding) {
        recyclerView.adapter = adapter

        refreshLayout.setOnRefreshListener {
            viewModel.fetchData()
        }

    }

    private fun handleLoadingState() = with(binding) {
        refreshLayout.isRefreshing = true
    }

    private fun handleSuccessState(state: ProductListState.Success) = with(binding) {
        refreshLayout.isRefreshing = false

        if (state.productList.isEmpty()) {
            emptyResultTextView.isGone = false
            recyclerView.isGone = true
        } else {
            emptyResultTextView.isGone = true
            recyclerView.isGone = false
            adapter.setProductList(state.productList) {
                //하나의 아이템이 클릭될 때마다 아이템 클릭에대해서 실행하는 동작을 만듬
                // 인텐트 콜백
                startProductDetailForResult.launch(
                    ProductDetailActivity.newIntent(requireContext(), it.id)
               )

            }
        }
    }

    private fun handleErrorState() {
        Toast.makeText(requireContext(), "에러가 발생했습니다.", Toast.LENGTH_SHORT).show()
    }

}