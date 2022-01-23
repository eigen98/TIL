package com.example.shopping.data.repository

import com.example.shopping.data.entity.product.ProductEntity


//레포지토리 인터페이스만 뷰모델에 접근.
interface ProductRepository {

    suspend fun getProductList(): List<ProductEntity>

    suspend fun getLocalProductList(): List<ProductEntity>

    suspend fun insertProductItem(ProductItem: ProductEntity): Long

    suspend fun insertProductList(ProductList: List<ProductEntity>)

    suspend fun updateProductItem(ProductItem: ProductEntity)

    suspend fun getProductItem(itemId: Long): ProductEntity?

    suspend fun deleteAll()

    suspend fun deleteProductItem(id: Long)
}