package packagesearch.aop.mvvm.practice.di

import android.app.Activity
import packagesearch.aop.mvvm.practice.BuildConfig
import packagesearch.aop.mvvm.practice.data.api.SweetTrackerApi
import packagesearch.aop.mvvm.practice.data.api.Url
import packagesearch.aop.mvvm.practice.data.db.AppDatabase
import packagesearch.aop.mvvm.practice.data.entity.TrackingInformation
import packagesearch.aop.mvvm.practice.data.entity.TrackingItem
import packagesearch.aop.mvvm.practice.data.preference.PreferenceManager
import packagesearch.aop.mvvm.practice.data.preference.SharedPreferenceManager
import packagesearch.aop.mvvm.practice.data.repository.*
import packagesearch.aop.mvvm.practice.presentation.addtrackingitem.AddTrackingItemFragment
import packagesearch.aop.mvvm.practice.presentation.addtrackingitem.AddTrackingItemPresenter
import packagesearch.aop.mvvm.practice.presentation.addtrackingitem.AddTrackingItemsContract
import packagesearch.aop.mvvm.practice.presentation.trackinghistory.TrackingHistoryContract
import packagesearch.aop.mvvm.practice.presentation.trackinghistory.TrackingHistoryFragment
import packagesearch.aop.mvvm.practice.presentation.trackinghistory.TrackingHistoryPresenter
import packagesearch.aop.mvvm.practice.presentation.trackingitems.TrackingItemsContract
import packagesearch.aop.mvvm.practice.presentation.trackingitems.TrackingItemsFragment
import packagesearch.aop.mvvm.practice.presentation.trackingitems.TrackingItemsPresenter
import packagesearch.aop.mvvm.practice.work.AppWorkerFactory
import kotlinx.coroutines.Dispatchers
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.android.ext.koin.androidApplication
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.create

val appModule = module {

    single { Dispatchers.IO }

    // Database
    single { AppDatabase.build(androidApplication()) }
    single { get<AppDatabase>().trackingItemDao() }
    single { get<AppDatabase>().shippingCompanyDao() }

    // Api
    single {
        OkHttpClient()
            .newBuilder()
            .addInterceptor(
                HttpLoggingInterceptor().apply {
                    level = if (BuildConfig.DEBUG) {
                        HttpLoggingInterceptor.Level.BODY
                    } else {
                        HttpLoggingInterceptor.Level.NONE
                    }
                }
            )
            .build()
    }
    single<SweetTrackerApi> {
        Retrofit.Builder().baseUrl(Url.SWEET_TRACKER_API_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .client(get())
            .build()
            .create()
    }

    // Preference
    single { androidContext().getSharedPreferences("preference", Activity.MODE_PRIVATE) }
    single<PreferenceManager> { SharedPreferenceManager(get()) }

    // Repository
//    single<TrackingItemRepository> { TrackingItemRepositoryStub() }
    single<TrackingItemRepository> { TrackingItemRepositoryImpl(get(), get(), get()) }
    single<ShippingCompanyRepository> { ShippingCompanyRepositoryImpl(get(), get(), get(), get()) }

    // Work
    single { AppWorkerFactory(get(), get()) }

    // Presentation
    scope<TrackingItemsFragment> {
        scoped<TrackingItemsContract.Presenter> { TrackingItemsPresenter(getSource(), get()) }
    }
    scope<AddTrackingItemFragment> {
        scoped<AddTrackingItemsContract.Presenter> {
            AddTrackingItemPresenter(getSource(), get(), get())
        }
    }
    scope<TrackingHistoryFragment> {
        scoped<TrackingHistoryContract.Presenter> { (trackingItem: TrackingItem, trackingInformation: TrackingInformation) ->
            TrackingHistoryPresenter(getSource(), get(), trackingItem, trackingInformation)
        }
    }
}
