package com.example.shopping.domain

import com.example.shopping.data.entity.product.ProductEntity
import com.example.shopping.data.repository.ProductRepository

internal class OrderProductItemUseCase (
    private val productRepository: ProductRepository
): UseCase {

    suspend operator fun invoke(productEntity: ProductEntity): Long {
        return productRepository.insertProductItem(productEntity)
    }

}