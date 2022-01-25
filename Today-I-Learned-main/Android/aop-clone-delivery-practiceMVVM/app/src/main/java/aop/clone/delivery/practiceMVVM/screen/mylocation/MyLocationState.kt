package aop.clone.delivery.practiceMVVM.screen.mylocation

import aop.clone.delivery.practiceMVVM.data.entity.locaion.MapSearchInfoEntity

sealed class MyLocationState {

    object Uninitialized: MyLocationState()

    object Loading: MyLocationState()

    data class Success(
        val mapSearchInfoEntity: MapSearchInfoEntity
    ): MyLocationState()

    data class Confirm(
        val mapSearchInfoEntity: MapSearchInfoEntity
    ): MyLocationState()

}
