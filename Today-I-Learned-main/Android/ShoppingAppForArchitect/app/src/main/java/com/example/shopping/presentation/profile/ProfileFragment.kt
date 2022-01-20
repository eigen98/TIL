package com.example.shopping.presentation.profile

import com.example.shopping.databinding.FragmentProfileBinding
import com.example.shopping.presentation.BaseFragment
import org.koin.android.ext.android.inject

internal class ProfileFragment :BaseFragment<ProfileViewModel, FragmentProfileBinding>(){

    companion object{
        const val TAG = "ProfileFragment"
    }
    //뷰모델 추가
    override val viewModel: ProfileViewModel by inject<ProfileViewModel>()

    //뷰바인딩 추가
    override fun getViewBinding(): FragmentProfileBinding = FragmentProfileBinding.inflate(layoutInflater)

    override fun observeData() {

    }

}