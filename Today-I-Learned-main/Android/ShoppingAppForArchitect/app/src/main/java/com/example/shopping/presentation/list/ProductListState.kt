package com.example.shopping.presentation.list

import com.example.shopping.data.entity.product.ProductEntity

internal sealed class ProductListState {

    //상태에 맞는 녀석들을 추가해줌

    //UnInitialized 일때는 UI가 초기화
    object UnInitialized: ProductListState()

    //로딩중
    object Loading: ProductListState()

    //성공
    data class Success(
        val productList: List<ProductEntity>
    ): ProductListState()

    //에러
    object Error: ProductListState()

}