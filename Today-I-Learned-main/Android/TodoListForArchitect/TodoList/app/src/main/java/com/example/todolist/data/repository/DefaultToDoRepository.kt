package com.example.todolist.data.repository

import com.example.todolist.data.entity.ToDoEntity

class DefaultToDoRepository : ToDoRepository {



    override suspend fun getTodoList(): List<ToDoEntity> {
        TODO("Not yet implemented")
    }

    override suspend fun insertTodoList(toDoList: List<ToDoEntity>) {
        TODO("Not yet implemented")
    }
}