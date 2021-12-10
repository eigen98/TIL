package com.example.geoquiz.model

import androidx.annotation.StringRes
//@StringRes를 쓰는 이유 :
// 1.생성자에서 유효한 문자열 리소스Id를 제공하는지 컴파일 시점에서 Lint가 검사
// 2.다른 개발자가 확인하기 용이.
data class Question(@StringRes val textResId : Int, val answer : Boolean)
