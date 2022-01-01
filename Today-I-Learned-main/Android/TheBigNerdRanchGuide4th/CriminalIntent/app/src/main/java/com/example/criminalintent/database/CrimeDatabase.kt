package com.example.criminalintent.database

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import androidx.room.migration.Migration
import androidx.sqlite.db.SupportSQLiteDatabase
import com.example.criminalintent.Crime

@Database(entities = [Crime::class], version = 2)
@TypeConverters(CrimeTypeConverters::class)
abstract class CrimeDatabase : RoomDatabase() {

    //CrimeDao의 인스턴스를 생성할 수 있도록 데이터베이스클래스에 알려줌
    abstract fun crimeDao() : CrimeDao
}

val migration_1_2 = object : Migration(1,2){
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL(
                "ALTER TABLE Crime Add COLUMN suspect TEXT NOT NULL DEFAULT"
        )
    }
}