package com.example.shopping.presentation.main

import android.os.Bundle
import android.view.MenuItem
import androidx.fragment.app.Fragment
import com.example.shopping.R
import com.example.shopping.databinding.ActivityMainBinding
import com.example.shopping.presentation.BaseActivity
import com.example.shopping.presentation.list.ProductListFragment
import com.example.shopping.presentation.profile.ProfileFragment
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.google.android.material.navigation.NavigationView
import org.koin.android.ext.android.inject

//BaseActivity를 사용
internal class MainActivity : BaseActivity<MainViewModel,ActivityMainBinding>(), BottomNavigationView.OnNavigationItemSelectedListener{

    //구현해주어야할 viewModel을 구현. 코인모듈로 주입을 받기 위해 inject로 처리
    override val viewModel: MainViewModel by inject<MainViewModel>()

    //뷰바인딩을 가져옴
    override fun getViewBinding(): ActivityMainBinding = ActivityMainBinding.inflate(layoutInflater)


//    //뷰바인딩 추가
//    private lateinit var binding : ActivityMainBinding


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initViews()
    }

    //뷰를 초기화해주는 함수
    private fun initViews() = with(binding){
        //바텀네비게이션뷰를 처리할 수 있도록 만든다.
        //여기서 필요한 인터페이스를 구현할 것입니다.  BottomNavigationView.OnNavigationItemSelectedListener
        bottomNav.setOnNavigationItemSelectedListener(this@MainActivity)
        showFragment(ProductListFragment(), ProductListFragment.TAG)
    }
    //  인터페이스 구현
    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        //bottomnavigation뷰 이벤트를 달아줬는데 리스너 + 프래그먼트를 설정할 것임
        //프래그먼트는 각각의 패키지를 만들어서 넣어줌
        return when(item.itemId){
            R.id.menu_products -> {
                showFragment(ProductListFragment(), ProductListFragment.TAG)
                true
            }
            R.id.menu_profile -> {
                showFragment(ProfileFragment(), ProfileFragment.TAG)
                true
            }
            else -> false
        }
    }
    //프래그먼트 보여주는 함수
    // TAG가 있어야 기존의 프래그먼트를 찾기가 쉬워짐
    private fun showFragment(fragment : Fragment, tag : String){
        val findFragment = supportFragmentManager.findFragmentByTag(tag)
        //기존에 프래그먼트가 백스택에 있다면
        supportFragmentManager.fragments.forEach{ fm ->
            //매니저에서 꺼내서 hide해주고 커밋
            supportFragmentManager.beginTransaction().hide(fm).commit()

        }
        //프래그먼트가 있으면
        findFragment?.let {
            supportFragmentManager.beginTransaction().show(it).commit()
        } ?: kotlin.run { //없다면
            supportFragmentManager.beginTransaction()
                .add(R.id.fragmentContainer,fragment, tag)
                //Fragment commit은 onSaveInstanceState() 이전에 호출되어야함.
                // 어기면 예외발생(화면회전시) 이런경우 이것을 호출
                .commitAllowingStateLoss()
        }

    }


    override fun observeData() = viewModel.mainStateLiveData.observe(this){
        when(it){
            is MainState.RefreshOrderList ->{
               val fragment = supportFragmentManager.findFragmentByTag(ProfileFragment.TAG)
            }
        }
    }
}