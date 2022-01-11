package com.example.todolist.di
import com.example.todolist.data.repository.TestToDoRepository
import com.example.todolist.data.repository.ToDoRepository
import com.example.todolist.domain.todo.GetTodoListUseCase
import com.example.todolist.domain.todo.InsertTodoListUseCase
import com.example.todolist.presentation.list.ListViewModel
import org.koin.android.experimental.dsl.viewModel
import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module
internal val appTestModule = module{

    //ViewModel
    viewModel{ ListViewModel(get()) }


    //UseCase
    factory { GetTodoListUseCase(get()) }
    factory { InsertTodoListUseCase(get()) }

    //Repository

    single<ToDoRepository> {
        TestToDoRepository()
    }
}