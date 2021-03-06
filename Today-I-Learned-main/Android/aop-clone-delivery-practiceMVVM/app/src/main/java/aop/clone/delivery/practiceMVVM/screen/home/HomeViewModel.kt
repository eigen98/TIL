package aop.clone.delivery.practiceMVVM.screen.home

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import aop.clone.delivery.practiceMVVM.R
import aop.clone.delivery.practiceMVVM.data.entity.locaion.LocationLatLngEntity
import aop.clone.delivery.practiceMVVM.data.entity.locaion.MapSearchInfoEntity
import aop.clone.delivery.practiceMVVM.data.entity.restaurant.RestaurantFoodEntity
import aop.clone.delivery.practiceMVVM.data.repository.map.MapRepository
import aop.clone.delivery.practiceMVVM.data.repository.restaurant.food.RestaurantFoodRepository
import aop.clone.delivery.practiceMVVM.data.repository.user.UserRepository
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import kotlinx.coroutines.launch

class HomeViewModel(
    private val mapRepository: MapRepository,
    private val userRepository: UserRepository,
    private val restaurantFoodRepository: RestaurantFoodRepository
) : BaseViewModel() {

    companion object {
        const val MY_LOCATION_KEY = "MyLocation"
    }

    val homeStateLiveData = MutableLiveData<HomeState>(HomeState.Uninitialized)

    val foodMenuBasketLiveData = MutableLiveData<List<RestaurantFoodEntity>>()

    fun loadReverseGeoInformation(
        locationLatLngEntity: LocationLatLngEntity
    ) = viewModelScope.launch {
        homeStateLiveData.value = HomeState.Loading
        val userLocation = userRepository.getUserLocation()
        val currentLocation = userLocation ?: locationLatLngEntity

        val addressInfo = mapRepository.getReverseGeoInformation(currentLocation)
        addressInfo?.let { info ->
            homeStateLiveData.value = HomeState.Success(
                MapSearchInfoEntity(
                    fullAddress = info.fullAddress ?: "주소 정보 없음",
                    name = info.buildingName ?: "빌딩정보 없음",
                    locationLatLng = currentLocation
                ),
                isLocationSame = userLocation == locationLatLngEntity
            )
        } ?: kotlin.run {
            homeStateLiveData.value = HomeState.Error(
                messageId = R.string.can_not_load_address_info
            )
        }
    }

    fun getMapSearchInfo(): MapSearchInfoEntity? {
        when (val data = homeStateLiveData.value) {
            is HomeState.Success -> {
                return data.mapSearchInfoEntity
            }
        }
        return null
    }

    fun checkMyBasket() = viewModelScope.launch {
        foodMenuBasketLiveData.value = restaurantFoodRepository.getAllFoodMenuListInBasket()
    }

}
