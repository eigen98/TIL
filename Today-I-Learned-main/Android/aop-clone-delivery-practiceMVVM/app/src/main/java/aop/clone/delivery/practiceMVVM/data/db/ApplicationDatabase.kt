package aop.clone.delivery.practiceMVVM.data.db

import androidx.room.Database
import androidx.room.RoomDatabase
import aop.clone.delivery.practiceMVVM.data.db.dao.FoodMenuBasketDao
import aop.clone.delivery.practiceMVVM.data.db.dao.LocationDao
import aop.clone.delivery.practiceMVVM.data.db.dao.RestaurantDao
import aop.clone.delivery.practiceMVVM.data.entity.locaion.LocationLatLngEntity
import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantEntity
import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantFoodEntity

@Database(
    entities = [LocationLatLngEntity::class, RestaurantFoodEntity::class, RestaurantEntity::class],
    version = 1,
    exportSchema = false
)

abstract class ApplicationDatabase: RoomDatabase() {

    companion object {
        const val DB_NAME = "ApplicationDataBase.db"
    }

    abstract fun LocationDao(): LocationDao

    abstract fun FoodMenuBasketDao(): FoodMenuBasketDao

    abstract fun RestaurantDao(): RestaurantDao

}
