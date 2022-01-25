package aop.clone.delivery.practiceMVVM.data.entity.review

data class ReviewEntity(
    val userId: String,
    val title: String,
    val createdAt: Long,
    val content: String,
    val rating: Float,
    val imageUrlList: List<String>? = null,
    val orderId: String,
    val restaurantTitle: String
)
