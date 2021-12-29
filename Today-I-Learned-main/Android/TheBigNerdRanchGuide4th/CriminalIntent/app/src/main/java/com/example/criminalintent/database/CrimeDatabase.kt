package com.example.criminalintent.database

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import com.example.criminalintent.Crime

@Database(entities = [Crime::class], version = 1)
@TypeConverters(CrimeTypeConverters::class)
abstract class CrimeDatabase : RoomDatabase() {

    //CrimeDao의 인스턴스를 생성할 수 있도록 데이터베이스클래스에 알려줌
    abstract fun crimeDao() : CrimeDao

}