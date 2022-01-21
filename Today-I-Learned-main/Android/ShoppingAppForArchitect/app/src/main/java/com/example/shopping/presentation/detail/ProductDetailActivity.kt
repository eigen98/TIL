package com.example.shopping.presentation.detail

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.core.view.isGone
import androidx.core.view.isVisible
import com.example.shopping.R
import com.example.shopping.databinding.ActivityProductDetailBinding
import com.example.shopping.extensions.load
import com.example.shopping.extensions.loadCenterCrop
import com.example.shopping.extensions.toast
import com.example.shopping.presentation.BaseActivity
import org.koin.android.ext.android.inject
import org.koin.core.parameter.parametersOf

internal class ProductDetailActivity : BaseActivity<ProductDetailViewModel,ActivityProductDetailBinding>() {

    companion object{
        const val PRODUCT_ID_KEY = "PRODUCT_ID_KEY"
        const val PRODUCT_ORDERED_RESULT_CODE = 99
        fun newIntent(context : Context, productId : Long) =
            Intent(context, ProductDetailActivity::class.java).apply {
                putExtra(PRODUCT_ID_KEY, productId)

            }
    }

    //뷰모델 주입
    override val viewModel by inject<ProductDetailViewModel> {
        parametersOf(
           // intent.getLongExtra()
        )
    }

    override fun getViewBinding(): ActivityProductDetailBinding  = ActivityProductDetailBinding.inflate(layoutInflater)



    override fun observeData() = viewModel.productDetailStateLiveData.observe(this){
        when (it) {
            is ProductDetailState.Uninitialized -> initViews()
            is ProductDetailState.Loading -> handleLoading()
            is ProductDetailState.Success -> handleSuccess(it)
            is ProductDetailState.Error -> handleError()
            is ProductDetailState.Order -> handleOrder()
        }
    }

    private fun initViews() = with(binding) {
        setSupportActionBar(toolbar)
        actionBar?.setDisplayHomeAsUpEnabled(true)
        actionBar?.setDisplayShowHomeEnabled(true)
        title = ""
        toolbar.setNavigationOnClickListener {
            finish()
        }

        orderButton.setOnClickListener {
            viewModel.orderProduct()
        }
    }

//    로딩중
    private fun handleLoading() = with(binding) {
        progressBar.isVisible = true
    }

    private fun handleSuccess(state: ProductDetailState.Success) = with(binding) {
        progressBar.isGone = true
        val product = state.productEntity
        title = product.productName
        productCategoryTextView.text = product.productType
        productImageView.loadCenterCrop(product.productImage, 8f)
        productPriceTextView.text = "${product.productPrice}원"
        introductionImageView.load(state.productEntity.productImage)
    }

    private fun handleError() {
        toast("제품 정보를 불러올 수 없습니다.")
        finish()
    }

    private fun handleOrder() {
        setResult(PRODUCT_ORDERED_RESULT_CODE)
        toast("성공적으로 주문이 완료되었습니다.")
        finish()
    }
}