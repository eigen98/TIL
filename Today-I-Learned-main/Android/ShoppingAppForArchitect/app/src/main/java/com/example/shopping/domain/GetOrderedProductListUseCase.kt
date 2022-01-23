package com.example.shopping.domain

import com.example.shopping.data.entity.product.ProductEntity
import com.example.shopping.data.repository.ProductRepository

internal class GetOrderedProductListUseCase(
    private val productRepository: ProductRepository
): UseCase {

    suspend operator fun invoke(): List<ProductEntity> {
        return productRepository.getLocalProductList()
    }

}