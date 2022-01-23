package packagesearch.aop.mvvm.practice.data.repository

import packagesearch.aop.mvvm.practice.data.entity.ShippingCompany
import packagesearch.aop.mvvm.practice.data.entity.TrackingInformation
import packagesearch.aop.mvvm.practice.data.entity.TrackingItem
import retrofit2.Response

interface ShippingCompanyRepository {

    suspend fun getShippingCompanies(): List<ShippingCompany>

    suspend fun getRecommendShippingCompany(invoice: String): ShippingCompany?
}
