package com.example.shopping.data.entity.product

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

/**
{
"id": "1",
"createdAt": "2021-04-23T19:44:11.102Z",
"product_name": "Handcrafted Fresh Keyboard",
"product_price": "263.00",
"product_image": "http://lorempixel.com/640/480/technics",
"product": "Bike",
"prodcut_introduction_image : "asdfghjks"
},
 우리는 다음과 같은 데이터를 받아올 것이다.
 이러한 데이터를 받기 위해 일단은 api를 통해 받아오는 것만 생각.
 */

//서버에서 오는 Json객체에 맞추어 Data class작성

@Entity
data class ProductEntity(
    @PrimaryKey val id: Long,
    val createdAt: Date,
    val productName: String,
    val productPrice: Int,
    val productImage: String,
    val productType: String,
    val productIntroductionImage: String
)
