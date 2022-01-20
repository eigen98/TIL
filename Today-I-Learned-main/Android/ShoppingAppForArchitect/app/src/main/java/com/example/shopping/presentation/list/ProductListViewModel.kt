package com.example.shopping.presentation.list

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import com.example.shopping.domain.GetProductListUseCase
import com.example.shopping.presentation.BaseViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

internal class ProductListViewModel(
    private val getProductListUseCase: GetProductListUseCase
) : BaseViewModel(){

    //라이브데이터
    private var _productListStateLiveData = MutableLiveData<ProductListState>(ProductListState.UnInitialized)
    val productListStateLiveData: LiveData<ProductListState> = _productListStateLiveData



    override fun fetchData() : Job = viewModelScope.launch(){
        //ProductUseCase는 fetchData하는 시점에 불러와주면 되겠음.

        setState(
            ProductListState.Loading //로딩상태
        )
        setState(
            ProductListState.Success( //성공시 가져온 usecase를 넣어줌
                getProductListUseCase()
            )
        )
    }

    private fun setState(state : ProductListState){
        _productListStateLiveData.postValue(state)
    }


}