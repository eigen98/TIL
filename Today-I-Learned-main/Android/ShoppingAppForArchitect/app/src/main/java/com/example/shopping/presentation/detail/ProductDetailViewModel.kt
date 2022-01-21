package com.example.shopping.presentation.detail

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.example.shopping.data.entity.product.ProductEntity
import com.example.shopping.domain.GetProductItemUseCase
import com.example.shopping.domain.OrderProductItemUseCase
import com.example.shopping.presentation.BaseViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

//productId값을 받고 api로 이 아이디에 해당하는 아이템을 추려서 가져오면 됨.
internal class ProductDetailViewModel(
    private val productId : Long,
    private val getProductItemUseCase: GetProductItemUseCase,
    private val orderProductItemUseCase: OrderProductItemUseCase
) : BaseViewModel() {

    private var _productDetailStateLiveData = MutableLiveData<ProductDetailState>(ProductDetailState.Uninitialized)
    val productDetailStateLiveData : LiveData<ProductDetailState> = _productDetailStateLiveData

    private lateinit var productEntity : ProductEntity

    //뷰모델 스코프로 가져옴
    override fun fetchData(): Job = viewModelScope.launch {
        setState(ProductDetailState.Loading)
        getProductItemUseCase(productId)?.let { product ->
            productEntity = product
            setState(
                ProductDetailState.Success(product)
            )
        } ?: kotlin.run{
            setState(ProductDetailState.Error)
        }
    }
    fun orderProduct() = viewModelScope.launch {
        if(::productEntity.isInitialized){
            val productId = orderProductItemUseCase(productEntity)
            if(productEntity.id == productId){
                setState(ProductDetailState.Order)
            }
        }else{
            setState(ProductDetailState.Error)
        }

    }

    private fun setState(state : ProductDetailState){
        _productDetailStateLiveData.postValue(state)
    }
}