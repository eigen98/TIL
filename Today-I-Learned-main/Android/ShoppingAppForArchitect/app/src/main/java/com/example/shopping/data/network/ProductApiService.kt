package com.example.shopping.data.network

import com.example.shopping.data.response.ProductResponse
import com.example.shopping.data.response.ProductsResponse
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Path

//레트로핏을 기반으로 동작
//그에 맞게 레트로핏의존성을 추가해주겠다.
interface ProductApiService {

    @GET("products")
    suspend fun getProducts(): Response<ProductsResponse>

    @GET("products/{productId}")
    suspend fun getProduct(@Path("productId") projectId : Long): Response<ProductResponse>


}