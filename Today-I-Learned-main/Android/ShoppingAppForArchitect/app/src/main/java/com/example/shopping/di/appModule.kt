package com.example.shopping.di

import com.example.shopping.data.network.buildOkHttpClient
import com.example.shopping.data.network.provideGsonConverterFactory
import com.example.shopping.data.network.provideProductApiService
import com.example.shopping.data.network.provideProductRetrofit
import com.example.shopping.data.repository.DefaultProductRepository
import com.example.shopping.data.repository.ProductRepository
import com.example.shopping.domain.GetProductItemUseCase
import kotlinx.coroutines.Dispatchers
import org.koin.dsl.module

val appModule = module{


    //Coroutine Dispatcher
    single{ Dispatchers.Main}
    single{ Dispatchers.IO}


    //UseCases
    factory{GetProductItemUseCase(get())}

    //Repositories
    single<ProductRepository>{ DefaultProductRepository(get(),get())}


    //이것을 가지고 여러곳에서 쓸 수 있도록 만듬
    single{ provideGsonConverterFactory()}
    single{ buildOkHttpClient()}
    single{ provideProductRetrofit(get(),get())}
    single { provideProductApiService(get()) }

}