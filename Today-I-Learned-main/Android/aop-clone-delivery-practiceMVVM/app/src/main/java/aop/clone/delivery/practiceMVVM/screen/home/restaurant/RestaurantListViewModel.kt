package aop.clone.delivery.practiceMVVM.screen.home.restaurant

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.viewModelScope
import aop.clone.delivery.practiceMVVM.data.entity.locaion.LocationLatLngEntity
import aop.clone.delivery.practiceMVVM.data.repository.restaurant.RestaurantRepository
import aop.clone.delivery.practiceMVVM.model.restaurant.RestaurantModel
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch

class RestaurantListViewModel(
    private val restaurantCategory: RestaurantCategory,
    private var locationLatLngEntity: LocationLatLngEntity,
    private val restaurantRepository: RestaurantRepository,
    private var restaurantFilterOrder: RestautantFilterOrder = RestautantFilterOrder.DEFAULT
) : BaseViewModel() {

    private var _restaurantListLiveData = MutableLiveData<List<RestaurantModel>>()
    val restaurantListLiveData: LiveData<List<RestaurantModel>>
        get() = _restaurantListLiveData

    override fun fetchData(): Job = viewModelScope.launch {
        val restaurantList = restaurantRepository.getList(restaurantCategory, locationLatLngEntity)
        val sortedList = when (restaurantFilterOrder) {
            RestautantFilterOrder.DEFAULT -> {
                restaurantList
            }
            RestautantFilterOrder.LOW_DELIVERY_TIP -> {
                restaurantList.sortedBy { it.deliveryTipRange.first }
            }
            RestautantFilterOrder.FAST_DELIVERY -> {
                restaurantList.sortedBy { it.deliveryTimeRange.first }
            }
            RestautantFilterOrder.TOP_RATE -> {
                restaurantList.sortedByDescending { it.grade }
            }
        }
        _restaurantListLiveData.value = sortedList.map {
            RestaurantModel(
                id = it.id,
                restaurantInfoId = it.restaurantInfoId,
                restaurantCategory = it.restaurantCategory,
                restaurantTitle = it.restaurantTitle,
                restaurantImageUrl = it.restaurantImageUrl,
                grade = it.grade,
                reviewCount = it.reviewCount,
                deliveryTimeRange = it.deliveryTimeRange,
                deliveryTipRange = it.deliveryTipRange,
                restaurantTelNumber = it.restaurantTelNumber
            )
        }
    }

    fun setLocationLatLng(locationLatLngEntity: LocationLatLngEntity) {
        this.locationLatLngEntity = locationLatLngEntity
        fetchData()
    }

    fun setRestaurantFilterOrder(order: RestautantFilterOrder) {
        this.restaurantFilterOrder = order
        fetchData()
    }

}
