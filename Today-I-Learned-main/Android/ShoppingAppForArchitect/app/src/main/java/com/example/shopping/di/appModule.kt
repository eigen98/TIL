package com.example.shopping.di

import com.example.shopping.data.db.provideDB
import com.example.shopping.data.db.provideToDoDao
import com.example.shopping.data.network.buildOkHttpClient
import com.example.shopping.data.network.provideGsonConverterFactory
import com.example.shopping.data.network.provideProductApiService
import com.example.shopping.data.network.provideProductRetrofit
import com.example.shopping.data.preference.PreferenceManager
import com.example.shopping.data.repository.DefaultProductRepository
import com.example.shopping.data.repository.ProductRepository
import com.example.shopping.domain.*
import com.example.shopping.domain.DeleteOrderedProductListUseCase
import com.example.shopping.domain.GetOrderedProductListUseCase
import com.example.shopping.domain.GetProductItemUseCase
import com.example.shopping.domain.GetProductListUseCase
import com.example.shopping.domain.OrderProductItemUseCase
import com.example.shopping.presentation.detail.ProductDetailViewModel
import com.example.shopping.presentation.list.ProductListViewModel
import com.example.shopping.presentation.main.MainViewModel
import com.example.shopping.presentation.profile.ProfileViewModel
import kotlinx.coroutines.Dispatchers

import org.koin.android.ext.koin.androidApplication
import org.koin.android.ext.koin.androidContext
import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module

val appModule = module{

    //주입할 객체를 만드는 방법 두가지
    //1. single방식(싱글톤) 2. factory방식(객체 불릴 때마다 새로 생성)

    //ViewModels
    //viewModel이라고하는 코인 확장함수. 뷰모델 빌더를 이용
    viewModel{MainViewModel()}
    viewModel{ProductListViewModel(get())}
    viewModel { ProfileViewModel(get(), get(), get()) }
    viewModel{(productId : Long ) -> ProductDetailViewModel(productId , get(), get())}

    //Coroutine Dispatcher
    single{ Dispatchers.Main}
    single{ Dispatchers.IO}


    //UseCases
    factory { GetProductListUseCase(get()) }
    factory { GetOrderedProductListUseCase(get()) }
    factory { GetProductItemUseCase(get()) }
    factory { OrderProductItemUseCase(get()) }
    factory { DeleteOrderedProductListUseCase(get()) }



    //Repositories
    single<ProductRepository> { DefaultProductRepository(get(), get(), get()) }
    //이것을 가지고 여러곳에서 쓸 수 있도록 만듬
    single{ provideGsonConverterFactory()}
    single{ buildOkHttpClient()}
    single{ provideProductRetrofit(get(),get())}
    single { provideProductApiService(get()) }


    single { PreferenceManager(androidContext()) }

    //Database
    single{provideDB(androidApplication())}
    single{ provideToDoDao(get())}

}