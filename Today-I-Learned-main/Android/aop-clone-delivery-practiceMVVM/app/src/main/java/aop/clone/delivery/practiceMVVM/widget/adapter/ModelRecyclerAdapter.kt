package aop.clone.delivery.practiceMVVM.widget.adapter

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import aop.clone.delivery.practiceMVVM.DeliveryApplication
import aop.clone.delivery.practiceMVVM.model.CellType
import aop.clone.delivery.practiceMVVM.model.Model
import aop.clone.delivery.practiceMVVM.screen.base.BaseViewModel
import aop.clone.delivery.practiceMVVM.util.mapper.ModelViewHolderMapper
import aop.clone.delivery.practiceMVVM.util.provider.DefaultResourcesProvider
import aop.clone.delivery.practiceMVVM.util.provider.ResourcesProvider
import aop.clone.delivery.practiceMVVM.widget.adapter.listener.AdapterListener
import aop.clone.delivery.practiceMVVM.widget.adapter.viewholder.ModelViewHolder

class ModelRecyclerAdapter<M : Model, VM: BaseViewModel>(
    private var modelList: List<Model>,
    private var viewModel: VM,
    private val resourcesProvider: ResourcesProvider = DefaultResourcesProvider(DeliveryApplication.appContext!!),
    private val adapterListener: AdapterListener
) : ListAdapter<Model, ModelViewHolder<M>>(Model.DIFF_CALLBACK) {

    override fun getItemCount(): Int = modelList.size

    override fun getItemViewType(position: Int) = modelList[position].type.ordinal

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ModelViewHolder<M> {
        return ModelViewHolderMapper.map(parent, CellType.values()[viewType], viewModel, resourcesProvider)
    }

    @Suppress("UNCHECKED_CAST")
    override fun onBindViewHolder(holder: ModelViewHolder<M>, position: Int) {
        with(holder) {
            bindData(modelList[position] as M)
            bindViews(modelList[position] as M, adapterListener)
        }
    }

    override fun submitList(list: List<Model>?) {
        list?.let { modelList = it }
        super.submitList(list)
    }
}
