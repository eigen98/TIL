package com.example.todolist.data.repository

import com.example.todolist.data.entity.ToDoEntity

//이 레포지토리 패턴을 통해 어떠한 함수를 추상화해서
// 호출하게 되면 각주입된 인스턴스에 맞게 원하는 데이터를 불러올 수 있게 만들기 위함

/**
 * 1. insertToDoList
 * 2. getTodoList
 *
 */
interface ToDoRepository {

    //여기에 있는 구현체를 기반으로 레포지토리 관리
    suspend fun getTodoList(): List<ToDoEntity>

    suspend fun insertTodoList(toDoList : List<ToDoEntity>)

}