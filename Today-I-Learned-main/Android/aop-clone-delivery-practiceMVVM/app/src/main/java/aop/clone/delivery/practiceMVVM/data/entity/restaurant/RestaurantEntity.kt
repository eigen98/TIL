package aop.clone.delivery.practiceMVVM.data.entity.restaurant

import android.os.Parcelable
import androidx.room.PrimaryKey
import androidx.room.TypeConverters
import aop.clone.delivery.practiceMVVM.data.entity.Entity
import aop.clone.delivery.practiceMVVM.screen.home.restaurant.RestaurantCategory
import aop.clone.delivery.practiceMVVM.util.convertor.RoomTypeConverters
import kotlinx.parcelize.Parcelize

@Parcelize
@androidx.room.Entity
@TypeConverters(RoomTypeConverters::class)
data class RestaurantEntity(
    override val id: Long,
    val restaurantInfoId: Long,
    val restaurantCategory: RestaurantCategory,
    @PrimaryKey val restaurantTitle: String,
    val restaurantImageUrl: String,
    val grade: Float,
    val reviewCount: Int,
    val deliveryTimeRange: Pair<Int, Int>,
    val deliveryTipRange: Pair<Int, Int>,
    val restaurantTelNumber: String?
): Entity, Parcelable
