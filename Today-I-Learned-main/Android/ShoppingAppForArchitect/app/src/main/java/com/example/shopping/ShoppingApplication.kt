package com.example.shopping

import android.app.Application
import com.example.shopping.di.appModule
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.startKoin
import org.koin.core.logger.Level

class ShoppingApplication : Application(){
    override fun onCreate() {
        super.onCreate()


        //의존성 주입을 위해서 컨테이너가 먼저 필요.
        startKoin{
            androidLogger(Level.ERROR)
            androidContext(this@ShoppingApplication)
            //주입할 모듈 만들기
            modules(appModule)
        }
    }

}