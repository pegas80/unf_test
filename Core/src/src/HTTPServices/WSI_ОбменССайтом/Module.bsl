
#Область ПрограммныйИнтерфейс

Функция GetGroupGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetGroupCategoriesGET(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
КонецФункции

Функция GetCategoriesGET(Запрос)
	Ответ = Новый HTTPСервисОтвет(200);
	Возврат Ответ;
КонецФункции

Функция GetNomenclatureGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetNomenclatureAttachedFilesGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetCharacteristicsGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetPropertiesGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetValuePropertiesGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetWarehouseGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetBalanceGoodsGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция UploadUpdateClientPOST(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция UploadUpdateSalesOrderPOST(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

Функция GetSalesOrderAttachedFilesGET(Запрос)
	
	HTTPСервисОтвет = Новый HTTPСервисОтвет(200);
	HTTPСервисОтвет.Заголовки.Вставить("Content-type", "application/json; charset=utf-8");
	
	Возврат HTTPСервисОтвет;
	
КонецФункции

#КонецОбласти
