package aop.clone.delivery.practiceMVVM.di

import aop.clone.delivery.practiceMVVM.data.TestOrderRepository
import aop.clone.delivery.practiceMVVM.data.TestRestaurantFoodRepository
import aop.clone.delivery.practiceMVVM.data.TestRestaurantRepository
import aop.clone.delivery.practiceMVVM.data.entity.locaion.LocationLatLngEntity
import aop.clone.delivery.practiceMVVM.data.repository.order.OrderRepository
import aop.clone.delivery.practiceMVVM.data.repository.restaurant.RestaurantRepository
import aop.clone.delivery.practiceMVVM.data.repository.restaurant.food.RestaurantFoodRepository
import aop.clone.delivery.practiceMVVM.screen.home.restaurant.RestaurantCategory
import aop.clone.delivery.practiceMVVM.screen.home.restaurant.RestaurantListViewModel
import aop.clone.delivery.practiceMVVM.screen.order.OrderMenuListViewModel
import com.google.firebase.auth.FirebaseAuth
import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module

internal val appTestModule = module {

    viewModel { (restaurantCategory: RestaurantCategory, locationLatLngEntity: LocationLatLngEntity) ->
        RestaurantListViewModel(restaurantCategory, locationLatLngEntity, get())
    }

    viewModel { (firebaseAuth: FirebaseAuth) -> OrderMenuListViewModel(get(), get(), firebaseAuth) }

    single<RestaurantRepository> { TestRestaurantRepository() }

    single<RestaurantFoodRepository> { TestRestaurantFoodRepository() }

    single<OrderRepository> { TestOrderRepository() }

}
