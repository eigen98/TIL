package com.example.shopping.data.response

import com.example.shopping.data.entity.product.ProductEntity
import java.util.*

//받았었던 json 스트림값을 그대로 파싱할 수 있도록 만들어줌

data class ProductResponse(
    val id: Long,
    val createdAt: Long,
    val productName: String,
    val productPrice: String,
    val productImage: String,
    val productType: String,
    val productIntroductionImage: String
){

    //함수를 추가하여
    //Entity로 바꿀 수 있는 형태로 만들어줌.
    fun toEntity():ProductEntity =
        ProductEntity(
            id = id.toLong(),
            createdAt = Date(createdAt),
            productName = productName,
            productPrice = productPrice.toDouble().toInt(),
            productImage = productImage,
            productType = productType,
            productIntroductionImage = productIntroductionImage
        )
}
