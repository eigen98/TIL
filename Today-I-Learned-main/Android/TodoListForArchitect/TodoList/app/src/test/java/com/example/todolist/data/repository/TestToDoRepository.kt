package com.example.todolist.data.repository

import com.example.todolist.data.entity.ToDoEntity


class TestToDoRepository : ToDoRepository {

    /**
     * 테스트를 할 때 안드로이드에 로컬 메모리 캐싱을 할 수 있는 방법이 없음.
     * 구글에서 권장하는 방법
     * 리스트 객체 만듬
     */

    private val toDoList : MutableList<ToDoEntity> = mutableListOf()

    override suspend fun getTodoList(): List<ToDoEntity> {
        return toDoList
    }

    override suspend fun insertTodoList(toDoList: List<ToDoEntity>) {
        this.toDoList.addAll(toDoList)
    }
}