package com.example.todolist.presentation.list

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.todolist.data.entity.ToDoEntity
import com.example.todolist.domain.todo.GetTodoListUseCase
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch


/**
 * 필요한 UserCase
 * 1. [GetTodoListUseCase]
 * 2. [UpdateTodoUseCase]
 * 3. [DeleteAllTodoItemUseCase]
 */

internal class ListViewModel(private val getTodoListUseCase: GetTodoListUseCase) : ViewModel() {

    private var _toDoListLiveData = MutableLiveData<List<ToDoEntity>>(listOf())
    val todoListLiveData : LiveData<List<ToDoEntity>> = _toDoListLiveData

    fun fetchData() : Job = viewModelScope.launch{
        _toDoListLiveData.postValue(getTodoListUseCase())
    }
}