package com.example.shopping.presentation

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.viewbinding.ViewBinding
import kotlinx.coroutines.Job

// 베이스 액티비티는 다음과 같이 제너릭으로 뷰모델과 뷰바인딩을 상속 받는 구현한 녀석들을 넘겨 받음
internal abstract class BaseActivity<VM: BaseViewModel, VB: ViewBinding>: AppCompatActivity() {

    //뷰모델을 다음과 같이 추상 변수로 둠
    abstract val viewModel: VM

    //뷰바인딩도 타입을 강제로 구현할 수 있도록 해둠
    protected lateinit var binding: VB

    abstract fun getViewBinding(): VB

    //뷰모델을 무조건 구현하도록 해두었음.
    // 아래 뷰모델의 fetchData를 구현하도록 만들 것인데 코루틴을 기반으로 동작.
    // 뷰모델 스코프에서 코루틴 블럭을 실행시키면 잡 인스턴스를 반환하는데
    // fetchJob이라는 이름으로 나중에 화면이 종료가 될 때 cancel 할 수 있도록 만들어서 코루틴을 종료시킬 수 있도록 만들것임.
    private lateinit var fetchJob: Job

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = getViewBinding()
        setContentView(binding.root)

        fetchJob = viewModel.fetchData()
        observeData()
    }

    abstract fun observeData()

    override fun onDestroy() {
        if (fetchJob.isActive) {
            fetchJob.cancel()
        }
        super.onDestroy()
    }

}