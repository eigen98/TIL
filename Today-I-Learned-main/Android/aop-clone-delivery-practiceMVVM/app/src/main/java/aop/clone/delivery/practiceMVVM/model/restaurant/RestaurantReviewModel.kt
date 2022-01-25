package aop.clone.delivery.practiceMVVM.model.restaurant

import android.net.Uri
import aop.clone.delivery.practiceMVVM.model.CellType
import aop.clone.delivery.practiceMVVM.model.Model

data class RestaurantReviewModel(
    override val id: Long,
    override val type: CellType = CellType.REVIEW_CELL,
    val title: String,
    val description: String,
    val grade: Float,
    val thumbnailImageUri: Uri? = null
): Model(id, type)
