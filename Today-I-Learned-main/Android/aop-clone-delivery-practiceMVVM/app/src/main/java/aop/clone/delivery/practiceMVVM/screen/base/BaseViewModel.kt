package aop.clone.delivery.practiceMVVM.screen.base

import android.os.Bundle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

abstract class BaseViewModel: ViewModel() {

    //데이터를 관리하기 위함.
    //안드로이드 컴포넌트 (액티비티, 프래그먼트)의 라이프사이클에 따라서 저장하여 관리할 수 있도록 처리
    protected var stateBundle: Bundle? = null

    //공통적으로 호출할 때 이함수를 호출하여 데이터를 가공
    //Job , 코루틴라이브러리를 이용하여 뷰모델 스코프로 특정 동작을 구현. (코루틴 의존성 추가)
    open fun fetchData(): Job = viewModelScope.launch {  }

    //뷰에대한 상태를 저장하기 위함. 종료되기전까지는 데이터 유지
    open fun storeState(stateBundle: Bundle) {
        this.stateBundle = stateBundle

    }

}
