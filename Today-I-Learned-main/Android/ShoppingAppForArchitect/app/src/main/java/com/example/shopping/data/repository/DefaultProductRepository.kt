package com.example.shopping.data.repository

import com.example.shopping.data.db.dao.ProductDao
import com.example.shopping.data.entity.product.ProductEntity
import com.example.shopping.data.network.ProductApiService
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.withContext

class DefaultProductRepository(
    private val productApi : ProductApiService,
    private val ioDispatcher : CoroutineDispatcher,
    private val productDao : ProductDao
) : ProductRepository{
    //withContext를 이용하면 비동기 작업을 순차코드처럼 작성.
    // IO쓰레드의 작업이 끝나기 전까지 MainThread에서 수행되는 코루틴을 일시 중단되도록 만듬.
    // IOThread의 작업이 끝나면 마지막 줄이 반환
    override suspend fun getProductList(): List<ProductEntity> = withContext(ioDispatcher) {
        //위의 api를 가져다가 getProducts라는 API를 호출해주는 방식
        //이는 레트로핏2의 response인 것을 알 수가 있음. 이것을 호출할시에 response가 성공했는지
        val response = productApi.getProducts()
        return@withContext if(response.isSuccessful){
            //해당 response의 바디를 꺼냄. items를 꺼내고 null이면 리스트로 반환
            response.body()?.items?.map{it.toEntity()} ?: listOf()
        }else {
            //success가 아닌 경우
            listOf()
        }
    }

    override suspend fun getLocalProductList(): List<ProductEntity> = withContext(ioDispatcher) {
        productDao.getAll()
    }

    override suspend fun insertProductItem(ProductItem: ProductEntity): Long = withContext(ioDispatcher) {
        productDao.insert(ProductItem)
    }

    override suspend fun insertProductList(ProductList: List<ProductEntity>) {
        TODO("Not yet implemented")
    }

    override suspend fun updateProductItem(ProductItem: ProductEntity) {
        TODO("Not yet implemented")
    }

    override suspend fun getProductItem(itemId: Long): ProductEntity? = withContext(ioDispatcher) {
        val response = productApi.getProduct(itemId)
        return@withContext if (response.isSuccessful) {
            response.body()?.toEntity()
        } else {
            null
        }
    }

    override suspend fun deleteAll() = withContext(ioDispatcher) {
        productDao.deleteAll()
    }

    override suspend fun deleteProductItem(id: Long) {
        TODO("Not yet implemented")
    }


}