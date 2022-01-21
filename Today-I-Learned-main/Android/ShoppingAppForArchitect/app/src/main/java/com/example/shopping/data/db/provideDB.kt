package com.example.shopping.data.db

import android.content.Context
import androidx.room.Room

//룸 디비 주입받기 위함
internal fun provideDB(context: Context): ProductDatabase =
    Room.databaseBuilder(context, ProductDatabase::class.java, ProductDatabase.DB_NAME).build()

internal fun provideToDoDao(database: ProductDatabase) = database.productDao()