package com.example.shopping.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.viewbinding.ViewBinding
import kotlinx.coroutines.Job

//프래그먼트도 마찬가지입니다.
internal abstract class BaseFragment<VM: BaseViewModel, VB: ViewBinding>: Fragment() {

    abstract val viewModel: VM

    protected lateinit var binding: VB

    abstract fun getViewBinding(): VB

    private lateinit var fetchJob: Job


    //차이점이 있다 한다면 onCreateView시점에 getViewBinding을 가져와서 바인딩 객체를 가져다가 루트로 반환하는 차이가 존재
    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = getViewBinding()
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        fetchJob = viewModel.fetchData()
        //추상함수로 만들어 알아서 구현할 수 있도록 만들것임
        observeData()
    }

    //일반적으로 뷰모델에서 라이브데이터를 통해 데이터를 넘겨줄 수 있으니까 라이브데이터를 통해 어떤 객체를, 어떤 스테이트를 넘겨주거나 로 구현하면 될 것 같음.
    abstract fun observeData()


    override fun onDestroyView() {
        super.onDestroyView()
        if (fetchJob.isActive) {
            fetchJob.cancel()
        }
    }
}