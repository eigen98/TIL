package com.example.todolist.viewmodel.todo

import androidx.lifecycle.ViewModel
import com.example.todolist.data.entity.ToDoEntity
import com.example.todolist.domain.todo.InsertTodoListUseCase
import com.example.todolist.presentation.list.ListViewModel
import com.example.todolist.viewmodel.ViewModelTest
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.test.runBlockingTest
import org.junit.Before
import org.junit.Test
import org.koin.test.inject


/**
 * 아직 만들지 않은
 * [ListViewModel]을 테스트하기 위한 Unit Test Class
 *
 * 1. initData() //init할 수 있는 데이터를 먼저 만들어줌 => 데이터가 잘 불러와지는지 테스트
 * 2. test ViewModel fetch를 호출했을 때 데이터가 잘 불러와지는지 테스트
 * 3. test Item update가 잘 되는지
 * 4. test Item Delete All 했을 때 잘 비워지는지
 */


@ExperimentalCoroutinesApi
internal class ListViewModelTest : ViewModelTest(){

    private val viewModel : ListViewModel by inject()

    private val insertTodoListUseCase : InsertTodoListUseCase by inject()

    private val mockList = (0 until 10).map{
        ToDoEntity(
                id = it.toLong(),
                title = "title $it",
                description = "description $it",
                hasCompleted = false
        )
    }

    /**
     * 필요한 useCase를 나열해보면
     * 1. InsertTodoListUseCase
     * 2.GetTodoItemUseCase
     */



    @Before
    fun init(){
        initData()
    }

    //데이터를 넣어서 로직검증을하기 위한 것을 만듬.
    private fun initData() = runBlockingTest {
        insertTodoListUseCase(mockList)
    }

    // Test: 입력된 데이터를 불러와서 검증한다.
    @Test
    fun `test viewModel fetch`() : Unit = runBlockingTest {
        val testObservable = viewModel.todoListLiveData.test()
        viewModel.fetchData()
        testObservable.assertValueSequence(
                listOf(
                        mockList
                )
        )
    }
}