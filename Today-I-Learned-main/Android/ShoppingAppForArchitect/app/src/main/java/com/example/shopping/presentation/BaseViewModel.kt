package com.example.shopping.presentation

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.Job
//뷰모델도 간단합니다
//fetchData를 통해서 잡인스턴스를 반환하는 형태로 구현을 해주었음.
internal abstract class BaseViewModel: ViewModel() {

    abstract fun fetchData(): Job

}