package com.example.shopping.presentation.profile

import androidx.lifecycle.viewModelScope
import com.example.shopping.presentation.BaseViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

internal class ProfileViewModel : BaseViewModel() {
    override fun fetchData() : Job = viewModelScope.launch(){}
}