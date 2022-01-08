package com.example.todolist.viewmodel

import android.app.Application
import com.example.todolist.di.appTestModule
import kotlinx.coroutines.*
import kotlinx.coroutines.test.TestCoroutineDispatcher
import kotlinx.coroutines.test.resetMain
import kotlinx.coroutines.test.setMain
import kotlinx.coroutines.test.withTestContext
import org.junit.After
import org.junit.Before


import org.junit.Rule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin
import org.koin.core.context.stopKoin
import org.koin.test.KoinTest
import org.mockito.Mock
import org.mockito.Mockito
import org.mockito.junit.MockitoJUnit
import org.mockito.junit.MockitoRule

@ExperimentalCoroutinesApi
internal class ViewModelTest : KoinTest {
    //코루틴을 이용할 것임

    @get:Rule
    val mockitoRule : MockitoRule = MockitoJUnit.rule()

   @Mock
   //mock 데이터 추가
   private lateinit var context : Application

    //코루틴 테스트 코드 작성을 위해 의존성 추가
    //다음은 스레드를 손쉽게 바꿀 수 있도록 테스트용 디스패쳐 추가
   private val dispatcher = TestCoroutineDispatcher()
    //가끔  임포트가 안 되는데 deprecated되서 그런가? 왜이러는지 모르겠음

    //실행

    @Before
    fun setup(){
        startKoin{
            androidContext(context)
            modules(appTestModule)
        }
        Dispatchers.setMain(dispatcher)
    }
    //테스트가 끝난 후

    @After
    fun tearDown(){
        stopKoin() //코인을 멈춤
        Dispatchers.resetMain() //Maindispatcher를 초기화 해주어야 메모리 누수가 발생하지 않는다.
    }


}