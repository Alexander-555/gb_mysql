:: Создание дампа
mysqldump example > example.sql

:: До развертывания дампа в mysql необходимо создать БД sample:
:: CREATE DATABASE IF NOT EXISTS sample;

:: Развертывание дампа в БД sample
mysql sample < example.sql