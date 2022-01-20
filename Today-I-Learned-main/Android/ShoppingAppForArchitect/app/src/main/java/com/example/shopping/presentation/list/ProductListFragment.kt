package com.example.shopping.presentation.list

import com.example.shopping.databinding.FragmentProductListBinding
import com.example.shopping.databinding.FragmentProfileBinding
import com.example.shopping.presentation.BaseFragment
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

}