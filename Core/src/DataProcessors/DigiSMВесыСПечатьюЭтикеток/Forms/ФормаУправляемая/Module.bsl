
&НаСервере
Процедура ТестПодключенияНаСервере()
	
	Драйвер = Новый COMОбъект("DigiSM.Scale");
	Драйвер.Registered = "Developer License, RS Line LLC, ID 404395463";
	Драйвер.Copyright  = "Scale-Soft Site: http://scale-soft.com Email: support@scale-soft.com";
	Драйвер.OpenConnect();
	Драйвер.About();
	Драйвер = "";
	
КонецПроцедуры

&НаКлиенте
Процедура ТестПодключения(Команда)
	
	//Драйвер = Новый COMОбъект("DigiSM.Scale");
	//Драйвер.Registered = "Developer License, RS Line LLC, ID 404395463";
	//Драйвер.Copyright  = "Scale-Soft Site: http://scale-soft.com Email: support@scale-soft.com";
	//Драйвер.OpenConnect();
	//Драйвер.About();
	//Драйвер = "";
	ТестПодключенияНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьИнформациюВВесы(Команда)
	
КонецПроцедуры
