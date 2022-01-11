package com.example.todolist.domain.todo

import com.example.todolist.data.entity.ToDoEntity
import com.example.todolist.data.repository.ToDoRepository
import com.example.todolist.domain.UseCase
//도메인 레이어에서 데이터 레이어로 단방향
//그때 필요한 레포지토리라고하는 연결할 수 있는 클래스 구성 필요
internal class InsertTodoListUseCase(private val toDoRepository: ToDoRepository) : UseCase {


    suspend operator fun invoke(toDoList : List<ToDoEntity>){
        return toDoRepository.insertTodoList(toDoList)
    }
}