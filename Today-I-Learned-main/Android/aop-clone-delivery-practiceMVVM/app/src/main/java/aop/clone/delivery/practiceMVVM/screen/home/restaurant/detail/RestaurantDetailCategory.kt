package aop.clone.delivery.practiceMVVM.screen.home.restaurant.detail

import androidx.annotation.StringRes
import aop.clone.delivery.practiceMVVM.R

enum class RestaurantDetailCategory(
    @StringRes val categoryNameId: Int
) {

    MENU(R.string.menu), REVIEW(R.string.review)

}
