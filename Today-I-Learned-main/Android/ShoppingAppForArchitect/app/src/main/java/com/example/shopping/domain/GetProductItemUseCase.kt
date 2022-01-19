package com.example.shopping.domain

import com.example.shopping.data.entity.product.ProductEntity
import com.example.shopping.data.repository.ProductRepository

internal class GetProductItemUseCase(
    private val productRepository: ProductRepository
): UseCase {

    suspend operator fun invoke(productId: Long): ProductEntity? {
        return productRepository.getProductItem(productId)
    }

}