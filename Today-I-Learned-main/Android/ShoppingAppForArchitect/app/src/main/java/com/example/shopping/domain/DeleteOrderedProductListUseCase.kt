package com.example.shopping.domain

import com.example.shopping.data.repository.ProductRepository
//도메인의 useCase는 개별기능, 비즈니스 논리 단위이며
//쉽게말하면 한개의 행동을 나타낸다. 이름만 보고 어떤 행동인지 유추 가능.
internal class DeleteOrderedProductListUseCase(
    private val productRepository: ProductRepository
): UseCase {

    suspend operator fun invoke() {
        return productRepository.deleteAll()
    }

}