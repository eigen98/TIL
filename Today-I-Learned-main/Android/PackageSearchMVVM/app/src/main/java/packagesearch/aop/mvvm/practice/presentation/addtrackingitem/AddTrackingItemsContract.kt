package packagesearch.aop.mvvm.practice.presentation.addtrackingitem

import packagesearch.aop.mvvm.practice.data.entity.ShippingCompany
import packagesearch.aop.mvvm.practice.data.entity.TrackingInformation
import packagesearch.aop.mvvm.practice.data.entity.TrackingItem
import packagesearch.aop.mvvm.practice.presentation.BasePresenter
import packagesearch.aop.mvvm.practice.presentation.BaseView

class AddTrackingItemsContract {

    interface View : BaseView<Presenter> {

        fun showShippingCompaniesLoadingIndicator()

        fun hideShippingCompaniesLoadingIndicator()

        fun showSaveTrackingItemIndicator()

        fun hideSaveTrackingItemIndicator()

        fun showRecommendCompanyLoadingIndicator()

        fun hideRecommendCompanyLoadingIndicator()

        fun showCompanies(companies: List<ShippingCompany>)

        fun showRecommendCompany(company: ShippingCompany)

        fun enableSaveButton()

        fun disableSaveButton()

        fun showErrorToast(message: String)

        fun finish()
    }

    interface Presenter : BasePresenter {

        var invoice: String?
        var shippingCompanies: List<ShippingCompany>?
        var selectedShippingCompany: ShippingCompany?

        fun fetchShippingCompanies()

        fun fetchRecommendShippingCompany()

        fun changeSelectedShippingCompany(companyName: String)

        fun changeShippingInvoice(invoice: String)

        fun saveTrackingItem()
    }
}
