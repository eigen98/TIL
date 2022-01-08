package com.example.todolist

import android.app.Application
import com.example.todolist.di.appModule
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.startKoin
import org.koin.core.logger.Level

class TodoListApplication :Application() {
    override fun onCreate() {
        super.onCreate()
        //TODO Koin Trigger

        //이제 어플리케이션 쪽에 모듈을 추가S
        startKoin{
            androidLogger(Level.ERROR)//에러발생시 로깅할 수 있도록
            androidContext(this@TodoListApplication) //컨텍스트
            //코인 모듈에 들어갈 것들
            //모듈들은 DI폴더에서 생성하겠다.
            modules(appModule)
        }



    }
}