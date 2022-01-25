package aop.clone.delivery.practiceMVVM.data.entity.restaurant

import android.net.Uri
import aop.clone.delivery.practiceMVVM.data.entity.Entity

data class RestaurantReviewEntity(
    override val id: Long,
    val title: String,
    val description: String,
    val grade: Int,
    val images: List<Uri>? = null
): Entity
