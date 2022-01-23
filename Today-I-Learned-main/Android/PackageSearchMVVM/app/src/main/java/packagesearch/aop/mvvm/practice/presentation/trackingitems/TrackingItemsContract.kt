package packagesearch.aop.mvvm.practice.presentation.trackingitems

import packagesearch.aop.mvvm.practice.data.entity.TrackingInformation
import packagesearch.aop.mvvm.practice.data.entity.TrackingItem
import packagesearch.aop.mvvm.practice.presentation.BasePresenter
import packagesearch.aop.mvvm.practice.presentation.BaseView

class TrackingItemsContract {

    interface View : BaseView<Presenter> {

        fun showLoadingIndicator()

        fun hideLoadingIndicator()

        fun showNoDataDescription()

        fun showTrackingItemInformation(trackingItemInformation: List<Pair<TrackingItem, TrackingInformation>>)
    }

    interface Presenter : BasePresenter {

        var trackingItemInformation: List<Pair<TrackingItem, TrackingInformation>>

        fun refresh()
    }
}
