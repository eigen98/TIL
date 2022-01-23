package packagesearch.aop.mvvm.practice.presentation

interface BaseView<PresenterT : BasePresenter> {

    val presenter: PresenterT
}
