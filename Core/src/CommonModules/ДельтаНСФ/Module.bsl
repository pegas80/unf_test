
Функция k_invoice( user_id, inv_id, k_type, su, sp, k_id) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<k_type>"+k_type+"</k_type>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("k_invoice", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "k_invoiceResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "k_id" Тогда k_id = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_makoreqtirebeli( user_id, inv_id, su, sp, k_id) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_makoreqtirebeli", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_makoreqtirebeliResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "k_id" Тогда k_id = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_seller_invoices( user_id, un_id, s_dt, e_dt, op_s_dt, op_e_dt, invoice_no, sa_ident_no, desc, doc_mos_nom, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<s_dt>"+s_dt+"</s_dt>"+"<e_dt>"+e_dt+"</e_dt>"+"<op_s_dt>"+op_s_dt+"</op_s_dt>"+"<op_e_dt>"+op_e_dt+"</op_e_dt>"+"<invoice_no>"+invoice_no+"</invoice_no>"+"<sa_ident_no>"+sa_ident_no+"</sa_ident_no>"+"<desc>"+desc+"</desc>"+"<doc_mos_nom>"+doc_mos_nom+"</doc_mos_nom>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_seller_invoices", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,2));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(30));
	//ТипКолДата = СоздатьОписаниеТипов("Дата");
	Result.Колонки.Добавить("Id", ТипКолСтрока);
	Result.Колонки.Добавить("f_series", ТипКолСтрока);
	Result.Колонки.Добавить("f_number", ТипКолСтрока);
	Result.Колонки.Добавить("operation_dt", ТипКолСтрока);
	Result.Колонки.Добавить("reg_dt", ТипКолСтрока);
	Result.Колонки.Добавить("seller_un_id", ТипКолСтрока);
	Result.Колонки.Добавить("buyer_un_id");
	Result.Колонки.Добавить("status", ТипКолСтрока);
	Result.Колонки.Добавить("seq_num_s", ТипКолСтрока);
	Result.Колонки.Добавить("user_id");
    Result.Колонки.Добавить("s_user_id");
	Result.Колонки.Добавить("k_id", ТипКолСтрока);
	Result.Колонки.Добавить("was_ref");
	Result.Колонки.Добавить("seq_num_b", ТипКолСтрока);
	Result.Колонки.Добавить("invoice_id");
	Result.Колонки.Добавить("b_s_user_id");
	Result.Колонки.Добавить("sa_ident_no");
	Result.Колонки.Добавить("org_name");
	Result.Колонки.Добавить("TANXA", ТипКолЧисло);
	Result.Колонки.Добавить("notes");
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "invoices" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда
				Если StartTag = "TANXA" Тогда
					Row[StartTag] = ФорматЧисла(ЧтениеXML.Значение);
				Иначе
					Row[StartTag] = ЧтениеXML.Значение;
				КонецЕсли;	
			КонецЕсли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_buyer_invoices( user_id, un_id, s_dt, e_dt, op_s_dt, op_e_dt, invoice_no, sa_ident_no, desc, doc_mos_nom, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<s_dt>"+s_dt+"</s_dt>"+"<e_dt>"+e_dt+"</e_dt>"+"<op_s_dt>"+op_s_dt+"</op_s_dt>"+"<op_e_dt>"+op_e_dt+"</op_e_dt>"+"<invoice_no>"+invoice_no+"</invoice_no>"+"<sa_ident_no>"+sa_ident_no+"</sa_ident_no>"+"<desc>"+desc+"</desc>"+"<doc_mos_nom>"+doc_mos_nom+"</doc_mos_nom>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_buyer_invoices", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,2));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(30));
	//ТипКолДата = СоздатьОписаниеТипов("Дата");
	
	Result.Колонки.Добавить("Id", ТипКолСтрока);
	Result.Колонки.Добавить("f_series", ТипКолСтрока);
	Result.Колонки.Добавить("f_number", ТипКолСтрока);
	Result.Колонки.Добавить("operation_dt", ТипКолСтрока);
	Result.Колонки.Добавить("reg_dt", ТипКолСтрока);
	Result.Колонки.Добавить("seller_un_id", ТипКолСтрока);
	Result.Колонки.Добавить("buyer_un_id");
	Result.Колонки.Добавить("status", ТипКолСтрока);
	Result.Колонки.Добавить("seq_num_s", ТипКолСтрока);
	Result.Колонки.Добавить("user_id");
    Result.Колонки.Добавить("s_user_id");
	Result.Колонки.Добавить("k_id", ТипКолСтрока);
	Result.Колонки.Добавить("was_ref");
	Result.Колонки.Добавить("seq_num_b", ТипКолСтрока);
	Result.Колонки.Добавить("invoice_id");
	Result.Колонки.Добавить("b_s_user_id");
	Result.Колонки.Добавить("sa_ident_no");
	Result.Колонки.Добавить("org_name");
	Result.Колонки.Добавить("TANXA", ТипКолЧисло);
	Result.Колонки.Добавить("notes");

	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "invoices" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда
				Если StartTag = "TANXA" Тогда
					Row[StartTag] = ФорматЧисла(ЧтениеXML.Значение);
				Иначе
					Row[StartTag] = ЧтениеXML.Значение;
				КонецЕсли;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_invoice_numbers( user_id, un_id, v_invoice_n, v_count, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<v_invoice_n>"+v_invoice_n+"</v_invoice_n>"+"<v_count>"+v_count+"</v_count>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_numbers", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoice_numbersResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_invoice_tins( user_id, un_id, v_invoice_t, v_count, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<v_invoice_t>"+v_invoice_t+"</v_invoice_t>"+"<v_count>"+v_count+"</v_count>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_tins", szRequest, Отказ); 
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoice_tinsResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_invoice_d( user_id, un_id, v_invoice_d, v_count, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<v_invoice_d>"+v_invoice_d+"</v_invoice_d>"+"<v_count>"+v_count+"</v_count>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_d", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoice_dResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_seller_invoices_r( user_id, un_id, status, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<status>"+status+"</status>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_seller_invoices_r", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(10,0));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(10));
	//ТипКолДата = СоздатьОписаниеТипов("Дата");
	Result.Колонки.Добавить("Id", ТипКолЧисло);
	Result.Колонки.Добавить("f_series", ТипКолСтрока);
	Result.Колонки.Добавить("f_number", ТипКолЧисло);
	Result.Колонки.Добавить("status",ТипКолЧисло);
	Result.Колонки.Добавить("reg_dt");
	Result.Колонки.Добавить("operation_dt");
	Result.Колонки.Добавить("sa_ident_no");	
	Result.Колонки.Добавить("org_name");
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "invoice_descs" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда 
				Row[StartTag] = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_buyer_invoices_r( user_id, un_id, status, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<status>"+status+"</status>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_buyer_invoices_r", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(10,0));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(10));
	//ТипКолДата = СоздатьОписаниеТипов("Дата");
	Result.Колонки.Добавить("Id", ТипКолЧисло);
	Result.Колонки.Добавить("f_series", ТипКолСтрока);
	Result.Колонки.Добавить("f_number", ТипКолЧисло);
	Result.Колонки.Добавить("status",ТипКолЧисло);
	Result.Колонки.Добавить("reg_dt");
	Result.Колонки.Добавить("operation_dt");
	Result.Колонки.Добавить("sa_ident_no");	
	Result.Колонки.Добавить("org_name");
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "invoice_descs" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда 
				Row[StartTag] = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;

КонецФункции 


Функция print_invoices( user_id, inv_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("print_invoices", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "print_invoicesResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_akciz( s_text, user_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<s_text>"+s_text+"</s_text>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_akciz", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_akcizResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_seq_nums( sag_periodi, user_id, su, sp) Экспорт 
	
	szRequest = "" +"<sag_periodi>"+sag_periodi+"</sag_periodi>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Отказ = Ложь;
	Результат = DoSendReceive("get_seq_nums", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(10,0));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(30));
	Result.Колонки.Добавить("SEQ_NUM", ТипКолСтрока);
	Если Отказ Тогда
		Возврат Result;
	КонецЕсли;
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "seq_nums" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда 
				Row[StartTag] = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция add_inv_to_decl( user_id, seq_num, inv_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<seq_num>"+seq_num+"</seq_num>"+"<inv_id>"+inv_id+"</inv_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("add_inv_to_decl", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "add_inv_to_declResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция save_invoice_request( inv_id, user_id, bayer_un_id, seller_un_id, overhead_no, dt, notes, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<inv_id>"+inv_id+"</inv_id>"+"<user_id>"+user_id+"</user_id>"+"<bayer_un_id>"+bayer_un_id+"</bayer_un_id>"+"<seller_un_id>"+seller_un_id+"</seller_un_id>"+"<overhead_no>"+overhead_no+"</overhead_no>"+"<dt>"+dt+"</dt>"+"<notes>"+notes+"</notes>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("save_invoice_request", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "save_invoice_requestResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция del_invoice_request( inv_id, user_id, bayer_un_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<inv_id>"+inv_id+"</inv_id>"+"<user_id>"+user_id+"</user_id>"+"<bayer_un_id>"+bayer_un_id+"</bayer_un_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("del_invoice_request", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "del_invoice_requestResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_invoice_request( inv_id, user_id, su, sp, bayer_un_id, seller_un_id, overhead_no, dt, notes) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<inv_id>"+inv_id+"</inv_id>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_request", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoice_requestResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "bayer_un_id" Тогда bayer_un_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "seller_un_id" Тогда seller_un_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "overhead_no" Тогда overhead_no = ЧтениеXML.Значение;
			Иначеесли StartTag = "dt" Тогда dt = ЧтениеXML.Значение;
			Иначеесли StartTag = "notes" Тогда notes = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция acsept_invoice_request_status( id, user_id, seller_un_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<id>"+id+"</id>"+"<user_id>"+user_id+"</user_id>"+"<seller_un_id>"+seller_un_id+"</seller_un_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("acsept_invoice_request_status", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "acsept_invoice_request_statusResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_requested_invoices( user_id, seller_un_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<seller_un_id>"+seller_un_id+"</seller_un_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_requested_invoices", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_requested_invoicesResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_invoice_requests( bayer_un_id, user_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<bayer_un_id>"+bayer_un_id+"</bayer_un_id>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_requests", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoice_requestsResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_seller_filter_count( un_id, user_id, su, sp, st_0, st_1, st_4, st_5, st_6, st_2, st_3, st_7, st_8) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<un_id>"+un_id+"</un_id>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_seller_filter_count", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_seller_filter_countResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_0" Тогда st_0 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_1" Тогда st_1 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_4" Тогда st_4 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_5" Тогда st_5 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_6" Тогда st_6 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_2" Тогда st_2 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_3" Тогда st_3 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_7" Тогда st_7 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_8" Тогда st_8 = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_buyer_filter_count( un_id, user_id, su, sp, st_1, st_5, st_6, st_2, st_3, st_7, st_8) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<un_id>"+un_id+"</un_id>"+"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_buyer_filter_count", szRequest, Отказ); 
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_buyer_filter_countResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_1" Тогда st_1 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_5" Тогда st_5 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_6" Тогда st_6 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_2" Тогда st_2 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_3" Тогда st_3 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_7" Тогда st_7 = ЧтениеXML.Значение;
			Иначеесли StartTag = "st_8" Тогда st_8 = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция what_is_my_ip() Экспорт 
	
	szRequest = "" ; 
	Отказ = Ложь;
	Результат = DoSendReceive("what_is_my_ip", szRequest, Отказ);
	Если Отказ Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "what_is_my_ipResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция create_ser_user( user_name, user_password, ip, notes, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_name>"+user_name+"</user_name>"+"<user_password>"+user_password+"</user_password>"+"<ip>"+ip+"</ip>"+"<note>"+notes+"</note>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	
	
	//szRequest = "<user_name>Tbilisi</user_name><user_password>123456</user_password><ip>92.51.66.4</ip><name>string</name><su>string</su><sp>string</sp>";
	Результат = DoSendReceive("create_ser_user", szRequest, Отказ); 
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "create_ser_userResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция update_ser_user( user_name, user_password, ip, notes, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_name>"+user_name+"</user_name>"+"<user_password>"+user_password+"</user_password>"+"<ip>"+ip+"</ip>"+"<notes>"+notes+"</notes>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("update_ser_user", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "update_ser_userResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_ser_users( user_name, user_password, user_id) Экспорт 
	
	szRequest = "" +"<user_name>"+user_name+"</user_name>"+"<user_password>"+user_password+"</user_password>"; 
	Отказ = Ложь;
	Результат = DoSendReceive("get_ser_users", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло0 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(10,0));
	ТипКолЧисло1 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,3));
	ТипКолЧисло2 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,2));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(10));
	ТипКолСтрока1 = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(150));
	ТипКолСтрока2 = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(15));
	ТипКолСтрока3 = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(500));
	Result.Колонки.Добавить("Id", ТипКолЧисло0);
	Result.Колонки.Добавить("user_name", ТипКолСтрока1);
	Result.Колонки.Добавить("user_id", ТипКолЧисло0);
	Result.Колонки.Добавить("ip", ТипКолСтрока2);
	Result.Колонки.Добавить("notes", ТипКолСтрока3);
	Если Отказ Тогда
		user_id = -1;
		Возврат Result;
	КонецЕсли;
		
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = "";
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 	
			Если ЧтениеXML.Имя = "get_ser_usersResult" Тогда 
				Пока ЧтениеXML.Прочитать() И НЕ (ЧтениеXML.ТипУзла = ТипУзлаXML.КонецЭлемента И ЧтениеXML.Имя = "get_ser_usersResult") Цикл 
					Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
						StartTag = ЧтениеXML.Имя; 
						Если StartTag = "users" Тогда
							Row = Result.Добавить();	 
						КонецЕсли;
					Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
						Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда 
							Row[StartTag] = ЧтениеXML.Значение;
						Конецесли; 
					Конецесли; 
				КонецЦикла; 
				StartTag = "";
			Иначе
				StartTag = ЧтениеXML.Имя;
			КонецЕсли;
		ИначеЕсли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст И StartTag = "user_id" Тогда
			user_id = ЧтениеXML.Значение;
		КонецЕсли;
	КонецЦикла;
	Возврат Result;
КонецФункции 


Функция get_ser_users_notes( tin) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<tin>"+tin+"</tin>"; 
	Результат = DoSendReceive("get_ser_users_notes", szRequest, Отказ);
	
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(150));
    Result.Колонки.Добавить("ID", ТипКолСтрока);
	Result.Колонки.Добавить("NOTES", ТипКолСтрока);
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "users" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда
				Row[StartTag] = ЧтениеXML.Значение;		
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
	//Пока ЧтениеXML.Прочитать() Цикл 
	//	Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
	//		Тогда StartTag = ЧтениеXML.Имя; 
	//	Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
	//		Если StartTag = "get_ser_users_notesResult" Тогда Result = ЧтениеXML.Значение;
	//		Конецесли; 
	//	Конецесли; 
	//КонецЦикла; 
	//Возврат Result;
КонецФункции 


Функция chek( su, sp, user_id, sua) Экспорт 
	
	szRequest = "" +"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"+"<user_id>"+user_id+"</user_id>"; 
	Отказ = Ложь;
	Результат = DoSendReceive("chek", szRequest, Отказ);
	Если Отказ Тогда
		Возврат "false";
	КонецЕсли;
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "chekResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "user_id" Тогда user_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "sua" Тогда sua = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция save_invoice( user_id, invois_id, operation_date, seller_un_id, buyer_un_id, overhead_no, overhead_dt, b_s_user_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<invois_id>"+invois_id+"</invois_id>"+"<operation_date>"+operation_date+"</operation_date>"
				+"<seller_un_id>"+seller_un_id+"</seller_un_id>"+"<buyer_un_id>"+buyer_un_id+"</buyer_un_id>"+"<overhead_no>"+overhead_no+"</overhead_no>"
				+"<overhead_dt>"+overhead_dt+"</overhead_dt>"+"<b_s_user_id>"+b_s_user_id+"</b_s_user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("save_invoice", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "save_invoiceResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "invois_id" Тогда invois_id = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_invoice( user_id, invois_id, su, sp, f_series, f_number, operation_dt, reg_dt, seller_un_id, buyer_un_id, overhead_no, overhead_dt, status, seq_num_s, seq_num_b, k_id, r_un_id, k_type, b_s_user_id, dec_status) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<invois_id>"+invois_id+"</invois_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_invoiceResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "f_series" Тогда f_series = ЧтениеXML.Значение;
			Иначеесли StartTag = "f_number" Тогда 
				//Функция возвращяет Номер СФ не понлый если номер начинаетца с "0".
				//перевод в семезначный номер
				КоличествоСим = СтрДлина(ЧтениеXML.Значение);
				Если КоличествоСим = 0 Тогда
					f_number = ЧтениеXML.Значение
				Иначе
					СтрокаНоль = "";
					Для Кол = 1 По 7 - КоличествоСим Цикл
						СтрокаНоль = СтрокаНоль + "0";
					КонецЦикла;
					f_number = СтрокаНоль + ЧтениеXML.Значение;
				КонецЕсли;
			Иначеесли StartTag = "operation_dt" Тогда operation_dt = ЧтениеXML.Значение;
			Иначеесли StartTag = "reg_dt" Тогда reg_dt = ЧтениеXML.Значение;
			Иначеесли StartTag = "seller_un_id" Тогда seller_un_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "buyer_un_id" Тогда buyer_un_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "overhead_no" Тогда overhead_no = ЧтениеXML.Значение;
			Иначеесли StartTag = "overhead_dt" Тогда overhead_dt = ЧтениеXML.Значение;
			Иначеесли StartTag = "status" Тогда status = ЧтениеXML.Значение;
			Иначеесли StartTag = "seq_num_s" Тогда seq_num_s = ЧтениеXML.Значение;
			Иначеесли StartTag = "seq_num_b" Тогда seq_num_b = ЧтениеXML.Значение;
			Иначеесли StartTag = "k_id" Тогда k_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "r_un_id" Тогда r_un_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "k_type" Тогда k_type = ЧтениеXML.Значение;
			Иначеесли StartTag = "b_s_user_id" Тогда b_s_user_id = ЧтениеXML.Значение;
			Иначеесли StartTag = "dec_status" Тогда dec_status = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_invoice_desc( user_id, invois_id, su, sp, ДляПечати = Ложь) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<invois_id>"+invois_id+"</invois_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_invoice_desc", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Result = Новый ТаблицаЗначений;
	ТипКолЧисло0 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(10,0));
	ТипКолЧисло1 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,3));
	ТипКолЧисло2 = Новый ОписаниеТипов("Число",,, Новый КвалификаторыЧисла(15,2));
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(150));
	//ТипКолДата = СоздатьОписаниеТипов("Дата");
	Result.Колонки.Добавить("id", ТипКолСтрока);
	Result.Колонки.Добавить("inv_id", ТипКолСтрока);
	Result.Колонки.Добавить("goods", ТипКолСтрока);
	Result.Колонки.Добавить("g_number", ТипКолЧисло1); 
	Result.Колонки.Добавить("g_unit", ТипКолСтрока);
	Result.Колонки.Добавить("full_amount", ТипКолЧисло2);  
	Result.Колонки.Добавить("drg_amount", ТипКолЧисло2);
	Result.Колонки.Добавить("aqcizi_amount", ТипКолЧисло2);
	Result.Колонки.Добавить("akciz_id", ТипКолСтрока);
	Result.Колонки.Добавить("sdrg_amount", ТипКолСтрока);

	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя; 
			Если StartTag = "invoices_descs" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда
				Если StartTag = "G_NUMBER" или StartTag = "FULL_AMOUNT" или StartTag = "DRG_AMOUNT" или StartTag = "AQCIZI_AMOUNT" или StartTag = "SDRG_AMOUNT" Тогда
					Если ДляПечати Тогда
						Row[StartTag] = ФорматЧисла(ЧтениеXML.Значение);
					Иначе
						Row[StartTag] = ?(ЧтениеXML.Значение = "-1", 0, ФорматЧисла(ЧтениеXML.Значение));
					КонецЕсли;
				Иначе
					Row[StartTag] = ЧтениеXML.Значение;
				КонецЕсли;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция save_invoice_desc( user_id, id, su, sp, invois_id, goods, g_unit, g_number, full_amount, drg_amount, aqcizi_amount, akciz_id) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<id>"+id+"</id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"+"<invois_id>"+invois_id+"</invois_id>"+"<goods>"+goods+"</goods>"+"<g_unit>"+g_unit+"</g_unit>"+"<g_number>"+g_number+"</g_number>"+"<full_amount>"+full_amount+"</full_amount>"+"<drg_amount>"+drg_amount+"</drg_amount>"+"<aqcizi_amount>"+aqcizi_amount+"</aqcizi_amount>"+"<akciz_id>"+akciz_id+"</akciz_id>"; 
	
	szRequest = УбратьСимволыВСтроке(szRequest);
	Результат = DoSendReceive("save_invoice_desc", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "save_invoice_descResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "id" Тогда id = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция delete_invoice_desc( user_id, id, inv_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<id>"+id+"</id>"+"<inv_id>"+inv_id+"</inv_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("delete_invoice_desc", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "delete_invoice_descResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_ntos_invoices_inv_nos( user_id, invois_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<invois_id>"+invois_id+"</invois_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_ntos_invoices_inv_nos", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML;
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	
	ТипКолСтрока = Новый ОписаниеТипов("Строка",,, Новый КвалификаторыСтроки(150));
	Result = Новый ТаблицаЗначений;
	Result.Колонки.Добавить("id", ТипКолСтрока);
	Result.Колонки.Добавить("overhead_no", ТипКолСтрока); 
	Result.Колонки.Добавить("overhead_dt", ТипКолСтрока);
	
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда 
			StartTag = ЧтениеXML.Имя;
			Если StartTag = "ntos_invoices_inv_nos" Тогда
				Row = Result.Добавить();	 
			КонецЕсли;
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если Result.Колонки.Найти(StartTag) <> Неопределено Тогда
				Row[StartTag] = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;

КонецФункции 


Функция save_ntos_invoices_inv_nos( invois_id, user_id, overhead_no, overhead_dt, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<invois_id>"+invois_id+"</invois_id>"+"<user_id>"+user_id+"</user_id>"+"<overhead_no>"+overhead_no+"</overhead_no>"+"<overhead_dt>"+overhead_dt+"</overhead_dt>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("save_ntos_invoices_inv_nos", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "save_ntos_invoices_inv_nosResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция delete_ntos_invoices_inv_nos( user_id, id, inv_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<id>"+id+"</id>"+"<inv_id>"+inv_id+"</inv_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("delete_ntos_invoices_inv_nos", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "delete_ntos_invoices_inv_nosResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_un_id_from_tin( user_id, tin, su, sp, name) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<tin>"+tin+"</tin>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_un_id_from_tin", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_un_id_from_tinResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "name" Тогда name = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 

Функция get_tin_from_un_id( user_id, un_id, su, sp, name) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_tin_from_un_id", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_tin_from_un_idResult" Тогда Result = ЧтениеXML.Значение;
			Иначеесли StartTag = "name" Тогда name = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция get_org_name_from_un_id( user_id, un_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<un_id>"+un_id+"</un_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_org_name_from_un_id", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_org_name_from_un_idResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция get_un_id_from_user_id( user_id, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("get_un_id_from_user_id", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "get_un_id_from_user_idResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция change_invoice_status( user_id, inv_id, status, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<status>"+status+"</status>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("change_invoice_status", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "change_invoice_statusResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция acsept_invoice_status( user_id, inv_id, status, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<status>"+status+"</status>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("acsept_invoice_status", szRequest, Отказ);
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "acsept_invoice_statusResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
	
КонецФункции 


Функция ref_invoice_status( user_id, inv_id, ref_text, su, sp) Экспорт 
	
	Отказ = Ложь;
	szRequest = "" +"<user_id>"+user_id+"</user_id>"+"<inv_id>"+inv_id+"</inv_id>"+"<ref_text>"+ref_text+"</ref_text>"+"<su>"+su+"</su>"+"<sp>"+sp+"</sp>"; 
	Результат = DoSendReceive("ref_invoice_status", szRequest, Отказ); 
	Если Отказ = Истина Тогда
		Возврат Ложь;
	КонецЕсли;
	
	ЧтениеXML = Новый ЧтениеXML; 
	ЧтениеXML.УстановитьСтроку(Результат); 
	StartTag = ""; 
	Пока ЧтениеXML.Прочитать() Цикл 
		Если ЧтениеXML.ТипУзла = ТипУзлаXML.НачалоЭлемента 
			Тогда StartTag = ЧтениеXML.Имя; 
		Иначеесли ЧтениеXML.ТипУзла = ТипУзлаXML.Текст Тогда 
			Если StartTag = "ref_invoice_statusResult" Тогда Result = ЧтениеXML.Значение;
			Конецесли; 
		Конецесли; 
	КонецЦикла; 
	Возврат Result;
КонецФункции 


Функция DoSendReceive(SoapAction, SoapArgs, Отказ = Ложь, ВремяОжидания = 30) Экспорт
	
	Перем mhttp;  
	
	Если mhttp = Неопределено Тогда
		//mhttp = Новый COMОбъект("MSXML2.XMLHTTP");    //Misha
		mhttp = Новый COMОбъект("WinHttp.WinHttpRequest.5.1");  //Misha
	Конецесли;
	
	mhttp.open("POST", "https://www.revenue.mof.ge/ntosservice/ntosservice.asmx", True);
	mhttp.setRequestHeader("Content-Type", "text/xml; charset=utf-8");
	mhttp.setRequestHeader("SoapAction","http://tempuri.org/" + SoapAction);
	
	xml = "<?xml version=""1.0"" encoding=""UTF-8""?>" 
	+ "<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" "
	+ "xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" "
	+ "xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/""><soap:Body>"
	+ "<" + SoapAction + " xmlns=""http://tempuri.org/"">"
	+ SoapArgs +  "</" + SoapAction +">"
	+ "</soap:Body></soap:Envelope>";
	
	Попытка
		mhttp.send(xml);
		res = mhttp.WaitForResponse(ВремяОжидания);
	Исключение
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = НСтр("ka='ინფორმაციის გადაცემის შეცდომა! შეამოწმეთ აწყობის პარამეტრების შევსება.';ru='Ошибка передачи информации! Проверьте правильность заполнения настроек.';en='Information Communication error! Check the correctness of the settings.'");
		Сообщение.Сообщить();
		Отказ = Истина;
		Возврат Ложь;
	КонецПопытки;	
	Если Не res Тогда
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = НСтр("ka='კავშირის შეცდომა!';ru='Ошибка связи!';en='Communication error!'");
		Сообщение.Сообщить();
		Отказ = Истина;
		Возврат Ложь;
		//ВызватьИсключение SoapAction + ": Ошибка связи! readyState = " + mhttp.readyState; 
	Конецесли;
	
	xml = mhttp.responseText;
	srchstr = "<" + SoapAction + "Response xmlns=""http://tempuri.org/"">";
	posstr1 = Найти( xml, srchstr);
	posstr2 = Найти( xml, "</" + SoapAction + "Response>");
	lenstr1 = СтрДлина(srchstr);
	Если  posstr1<1 Или posstr2<1 Или posstr1 +  lenstr1 = posstr2 Тогда
		//Сообщение = Новый СообщениеПользователю;
		//Сообщение.Текст = SoapAction + НСтр("ka=': მიღებულია მცდარი კონტენტი.';ru=': Получен Ошибочный Контент.';en=': Received an invalid content.'");
		//Сообщение.Сообщить();
		Отказ = Истина;
		//ВызватьИсключение SoapAction + ": Получен Ошибочный Контент: " + xml;
	Конецесли;
	
	Возврат  "<Response>" + Сред(xml, posstr1 + lenstr1, posstr2 - posstr1 - lenstr1) + "</Response>";
	
КонецФункции


//ДляФактур

Функция УбратьСимволыВСтроке(мСтрока)
	
	мСтрока	= СтрЗаменить(мСтрока, "&", "&amp;");
	
	Возврат	мСтрока;	
	
КонецФункции

Функция ФормированиеНаименования(Row, ИспользованиеХарактеристик) Экспорт
	
	Если ТипЗнч(Row.Номенклатура) = Тип("СправочникСсылка.Номенклатура") Тогда
		Если ИспользованиеХарактеристик и ЗначениеЗаполнено(Row.ХарактеристикаНоменклатуры) Тогда
			Возврат ?(Row.Номенклатура.НаименованиеПолное = "", Row.Номенклатура, Row.Номенклатура.НаименованиеПолное) + ?(ЗначениеЗаполнено(Row.ХарактеристикаНоменклатуры), ", " + Row.ХарактеристикаНоменклатуры, "");
		Иначе
			Возврат ?(Row.Номенклатура.НаименованиеПолное = "", Row.Номенклатура, Row.Номенклатура.НаименованиеПолное);
		КонецЕсли;
	ИначеЕсли ТипЗнч(Row.Номенклатура) = Тип("СправочникСсылка.ОсновныеСредства") Тогда
		Возврат ?(Row.Номенклатура.НаименованиеПолное = "", Row.Номенклатура, Row.Номенклатура.НаименованиеПолное);
	Иначе
		Возврат Row.Номенклатура;
	КонецЕсли;
	
КонецФункции

Функция ПроверкиПередСоеденением(Организация = Неопределено, su, sp, ПроверкаНаДекларирование = Ложь) Экспорт
	
	ТекущийПользователь = Пользователи.ТекущийПользователь();
	УчетПоБрендам = Константы.УчетПоБрендам.Получить();
	//ОсновнаяОрганизация = УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(ТекущийПользователь, "ОсновнаяОрганизация");
	СервисЭлектронныхСФ = Константы.СервисЭлектронныхСФ.Получить();
	ОсновнойПользовательНалоговогоСервера = Пользователи.ТекущийПользователь();
	ОсновнаяОрганизация = ОсновнойПользовательНалоговогоСервера.Владелец;
	
	СписокОрганизаций = Новый СписокЗначений;
	
	Если Организация <> Неопределено Тогда
		Если не УчетПоБрендам Тогда
			СписокОрганизаций.Добавить(Организация);
		Иначе	
			Запрос = Новый Запрос;
			Запрос.Текст = "ВЫБРАТЬ
			               |	Организации.Ссылка
			               |ИЗ
			               |	Справочник.Организации КАК Организации
			               |ГДЕ
			               |	Организации.Ссылка В ИЕРАРХИИ(&Ссылка)";
						   
			Запрос.УстановитьПараметр("Ссылка", ГлавнаяОрганизация(Организация));					   
			Выборка = Запрос.Выполнить().Выбрать();
			
			Пока Выборка.Следующий() Цикл
				СписокОрганизаций.Добавить(Выборка.Ссылка);
			КонецЦикла;
		КонецЕсли;
	КонецЕсли;
	
	Если ПроверкаНаДекларирование Тогда
		Декларирование = Константы.Декларирование.Получить();
		Если Не (СервисЭлектронныхСФ Или Декларирование) Тогда
			СтрокаСообщения = НСтр("ka='ელექტრონული ანგარიშ-ფაქტურებისა და დეკლარირების სერვისი გამორთულია';ru='Настройки сервис электронных счет-фактур и декларирования выключены';en='Settings service electronic invoices and declaration off'");
			ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
			Возврат Ложь;
		КонецЕсли;
	Иначе
		Если не СервисЭлектронныхСФ Тогда
			СтрокаСообщения = НСтр("ka='ელექტრონული ანგარიშ-ფაქტურების სერვისი გამორთულია';ru='Сервис электронных счет-фактур выключен';en='Service electronic invoices off'");
			ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
			Возврат Ложь;
		КонецЕсли;
	КонецЕсли;
	
	Если не ЗначениеЗаполнено(ОсновнойПользовательНалоговогоСервера) Тогда
		СтрокаСообщения = НСтр("ka='არ არის შევსებული მომხმარებლის ""საგადასახადო სერვერის ძირითადი მომხმარებელი""';ru='В настройках пользователя не заполнен ""Основной пользователь налогового сервера""';en='User settings are not filled ""main server user tax""'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
	
	Если не ОсновнойПользовательНалоговогоСервера.Активирован Тогда
		СтрокаСообщения = НСтр("ka='საგადასახადო სერვერის მომხმარებელი არ არის გააქტიურებული';ru='Пользователь налогового сервера не активирован';en='User tax server is not activated'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;

	Если не ЗначениеЗаполнено(ОсновнойПользовательНалоговогоСервера.Пароль) Тогда
		СтрокаСообщения = НСтр("ka='საგადასახადო სერვერის მომხმარებელის პაროლი არ არის შევსებული';ru='Пароль пользователя налогового сервера не заполнен';en='Password tax server is empty'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
	
	Если не ЗначениеЗаполнено(ОсновнойПользовательНалоговогоСервера.ИП) Тогда
		СтрокаСообщения = НСтр("ka='საგადასახადო სერვერის მომხმარებელის IP არ არის შევსებული';ru='IP пользователя налогового сервера не заполнен';en='IP server user tax is empty'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;

	Если Организация <> Неопределено и СписокОрганизаций.НайтиПоЗначению(ОсновнаяОрганизация) = Неопределено Тогда
		СтрокаСообщения = НСтр("ka='საგადასახადო სერვერის ძირითადი მომხმარებელის ორგანიზაცია არ შეესაბამება ორგანიზაციას';ru='Организация основного пользователя налогового сервера не совпадает с организацией';en='Organization of the main server user tax is not the same organization'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
	
	Если не ЗначениеЗаполнено(ОсновнаяОрганизация.ПользовательСинхронизацииСФ) Тогда
		СтрокаСообщения = НСтр("ka='ორგანიზაციაში არ არის შევსებული ""საგადასახადო სერვერის მომხმარებელი""';ru='У организации не заполнен ""Пользователь налогового сервера""';en='The organization is not filled with ""user tax server""'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
		
	Если не ЗначениеЗаполнено(ОсновнаяОрганизация.ПарольСинхронизацииСФ) Тогда
		СтрокаСообщения = НСтр("ka='ორგანიზაციაში არ არის შევსებული ""საგადასახადო სერვერის პაროლი""';ru='У организации не заполнен ""Пароль налогового сервера""';en='The organization is not filled with ""Password Server tax""'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
	
    Если не ЗначениеЗаполнено(ОсновнаяОрганизация.ИНН) Тогда
		СтрокаСообщения = НСтр("ka='ორგანიზაციის საიდენტიფიკაციო კოდი არ არის შევსებული';ru='ИНН организации не заполнен';en='INN organization is empty'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;
	
	su = ОсновнойПользовательНалоговогоСервера.Наименование;
	sp = ОсновнойПользовательНалоговогоСервера.Пароль;
	Возврат Истина;	
	
КонецФункции

&НаСервере
Функция ГлавнаяОрганизация(Организация)
	
	ГлавнаяОрганизация = Организация;
    ОрганизацияКонецЦикла = Ложь;
	Пока ОрганизацияКонецЦикла = Ложь Цикл
		Если ГлавнаяОрганизация.Родитель <> Справочники.Организации.ПустаяСсылка() Тогда
			ГлавнаяОрганизация = ГлавнаяОрганизация.Родитель;
		Иначе
			ОрганизацияКонецЦикла = Истина
		КонецЕсли;
	КонецЦикла;
	
	Возврат ГлавнаяОрганизация 
	
КонецФункции

Функция ПроверкаСтатусаСФ(user_id, su, sp, invois_id, k_id = Неопределено, dec_status = Неопределено, seq_num_s = Неопределено, Первичная = Ложь) Экспорт
	
	Перем sua;
	Перем f_series;
	Перем f_number;
	Перем operation_dt;
	Перем reg_dt;
	Перем seller_un_id;
	Перем buyer_un_id;
	Перем overhead_no;
	Перем overhead_dt;
	Перем status;
	Перем seq_num_b;
	Перем r_un_id;
	Перем k_type;
	Перем b_s_user_id;

	Если ДельтаНСФ.get_invoice(user_id, invois_id, su, sp, f_series, f_number, operation_dt, reg_dt, seller_un_id, buyer_un_id, overhead_no, overhead_dt, status, seq_num_s, seq_num_b, k_id, r_un_id, k_type, b_s_user_id, dec_status) <> "true" Тогда
		Если Первичная Тогда
			СтрокаПервичная = НСтр("ka='პირველადი ანგარიშ-ფაქტურა';ru='Первичная счет-фактура';en='Primary invoice'");
		Иначе
			СтрокаПервичная = НСтр("ka='ანგარიშ-ფაქტურა';ru='Счет-фактура';en='Invoice'");
		КонецЕсли;
		СтрокаСообщения = СтрокаПервичная + НСтр("ru = ' с онлайн номером : '; ka = ' ონლაინ ნომრით: '") + invois_id + НСтр("ru = ' не найдена'; ka = ' ვერ მოიძებნა'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
        Возврат Ложь;
	КонецЕсли;

	Возврат status;
	
КонецФункции

Функция ПолучитьСтатус(Статус) Экспорт
	
	Если Статус = "-1" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.Удаленная;
	ИначеЕсли Статус = "0" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.Новый;
	ИначеЕсли Статус = "1" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.Отправленный;
	ИначеЕсли Статус = "2" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.Подтвержденный;
	ИначеЕсли Статус = "3" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.ПервичнаяСчетФактура;
	ИначеЕсли Статус = "4" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.НоваяКорректировочнаяСчетФактура;
	ИначеЕсли Статус = "5" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.КорректировочнаяСчетФактураОтправленная;
	ИначеЕсли Статус = "6" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.ОтмененнаяСчетФактура;
	ИначеЕсли Статус = "7" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.ОтмененнаяПодтвержденнаяСчетФактура;
	ИначеЕсли Статус = "8" Тогда
		Возврат Перечисления.СтатусыСчетФактуры.ПодтвержденнаяКорректировочнаяСчетФактура;
	КонецЕсли;
	
КонецФункции

Функция ПолучитьТипКорректировоки(Тип) Экспорт
	
	Если Тип = "1" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ОтмененаОперация;
	ИначеЕсли Тип = "2" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ИзмененВидОперации;
	ИначеЕсли Тип = "3" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ИзмененаСуммаОперации;
	ИначеЕсли Тип = "4" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ВозвратТовара;
	Иначе
		Возврат Перечисления.ПричиныКорректировкиСФ.ПустаяСсылка();
	КонецЕсли;
	
КонецФункции

Функция ПроверкаНаСоответствиеКорректировки(НомерОснования, Корректировочная, СтрокаСообщения = Неопределено) Экспорт
	
	Если (НомерОснования = "-1" и Корректировочная) или (НомерОснования <> "-1" и не Корректировочная) Тогда
		Если СтрокаСообщения  = Неопределено Тогда
			СтрокаСообщения = НСтр("ka='ანგარიშ-ფაქტურის და ელექტრონული ანგარიშ-ფაქტურის კორექტირების სტატუსი არ შეესაბამება ერთმანეთს';ru='Статусы корректировок счет фактуры и электронной счет-фактуры не совпадают';en='Statuses adjustments by invoices and e-invoices do not match'");
		КонецЕсли;	
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;	
	Иначе
		Возврат Истина;
	КонецЕсли;
	
КонецФункции
	
Функция ПолучениеТипаКорректировки(СтатусКорректировочнойСчетФактуры) Экспорт
	
	Если Не ЗначениеЗаполнено(СтатусКорректировочнойСчетФактуры) Тогда
		СтрокаСообщения = НСтр("ka='არ არის შევსებული ""კორექტირების ანგარიშ-ფაქტურის სტატუსი""';ru='Не заполнен ""Статус корректировочной счет-фактуры""';en='Is empty ""status of the corrective invoice""'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	ИначеЕсли СтатусКорректировочнойСчетФактуры = Перечисления.ПричиныКорректировкиСФ.ОтмененаОперация Тогда
		Возврат "1";
	ИначеЕсли СтатусКорректировочнойСчетФактуры = Перечисления.ПричиныКорректировкиСФ.ИзмененВидОперации Тогда
		Возврат "2";
	ИначеЕсли СтатусКорректировочнойСчетФактуры = Перечисления.ПричиныКорректировкиСФ.ИзмененаСуммаОперации Тогда
		Возврат "3";
	ИначеЕсли СтатусКорректировочнойСчетФактуры = Перечисления.ПричиныКорректировкиСФ.ВозвратТовара Тогда
		Возврат "4";
	КонецЕсли;		

КонецФункции

Функция ДатаВремяВСтроку(Дата) Экспорт
	
	Если не ЗначениеЗаполнено(Дата) Тогда
		Возврат "";
	Иначе
		ДатаСтрока = Строка(Формат(Дата, "ДФ='yyyy-MM-dd'")) + "T" + Строка(Формат(Дата, "ДФ=HH:mm:ss"));
		Возврат ДатаСтрока;
	КонецЕсли;
	
КонецФункции

Функция ПереводВДату(ДатаСтрока) Экспорт
	
	День = Сред(ДатаСтрока, 9, 2);
	Месяц = Сред(ДатаСтрока, 6, 2);
	Год = Сред(ДатаСтрока, 1, 4);

	Если ДатаСтрока = Неопределено или СтрДлина(ДатаСтрока) > 10 Тогда
		Час = Сред(ДатаСтрока, 12, 2);
		Минута = Сред(ДатаСтрока, 15, 2);
		Секунда = Сред(ДатаСтрока, 18, 2);
		Возврат Дата(Год, Месяц, День, Час, Минута, Секунда);
	ИначеЕсли Год <> "" и Месяц <> "" и День <> "" Тогда
		Возврат Дата(Год, Месяц, День);
	Иначе
		Возврат Дата('00010101');
	КонецЕсли;
	
КонецФункции

Функция ПолученияСтатусаКорректировки(user_id, su, sp, invois_id, НомерСтроки = Неопределено) Экспорт
	
	Перем sua;
	Перем f_series;
	Перем f_number;
	Перем operation_dt;
	Перем reg_dt;
	Перем seller_un_id;
	Перем buyer_un_id;
	Перем overhead_no;
	Перем overhead_dt;
	Перем status;
	Перем seq_num_s;
	Перем seq_num_b;
	Перем r_un_id;
	Перем k_type;
	Перем b_s_user_id;
	Перем dec_status;
	Перем k_id;

	Если ДельтаНСФ.get_invoice(user_id, invois_id, su, sp, f_series, f_number, operation_dt, reg_dt, seller_un_id, buyer_un_id, overhead_no, overhead_dt, status, seq_num_s, seq_num_b, k_id, r_un_id, k_type, b_s_user_id, dec_status) <> "true" Тогда
		СтрокаСообщения = ?(НомерСтроки = Неопределено, "", НСтр("ru = 'В строке номер "+НомерСтроки+": '; ka = 'სტრიქონში ნომერ "+НомерСтроки+": '")) + НСтр("ka='შეცდომა ანგარიშ-ფაქტურის მიღებისას';ru='Ошибка при получении счет-фактуры';en='Error retrieving invoices'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
        Возврат Ложь;
	КонецЕсли;

	Если k_type = "1" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ОтмененаОперация;
	ИначеЕсли k_type = "2" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ИзмененВидОперации;
	ИначеЕсли k_type = "3" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ИзмененаСуммаОперации;
	ИначеЕсли k_type = "4" Тогда
		Возврат Перечисления.ПричиныКорректировкиСФ.ВозвратТовара;
	Иначе
		Возврат Перечисления.ПричиныКорректировкиСФ.ПустаяСсылка();
	КонецЕсли;
	
КонецФункции

Функция ПолучитьСтатусДекларации(seq_num_s, dec_status) Экспорт	

	Если seq_num_s = Неопределено или seq_num_s = "" Тогда
		Возврат Перечисления.СтатусыДекларации.НеПривязанаКДекларации;
	ИначеЕсли dec_status = "0" Тогда
		Возврат	Перечисления.СтатусыДекларации.ПривязанаКДекларации;
	Иначе
		Возврат Перечисления.СтатусыДекларации.Задекларированна;
	КонецЕсли;
	
КонецФункции

Функция ФорматЧисла(СтрокаЧисло) Экспорт
	
	СтрокаФормат = Строка(1234.5);
	Номер2 = Найти(СтрокаФормат, "2");
	//РазделительГрупп = Сред(СтрокаФормат, 2, Номер2 - 2);
	РазделительДробнойЧасти = Сред(СтрокаФормат, Номер2 + 3, СтрДлина(СтрокаФормат) - (Номер2 + 3));
	
	Возврат СтрЗаменить(СтрокаЧисло, ".", РазделительДробнойЧасти);	
	
КонецФункции

Процедура УдалениеПробеловВРеквизите(Реквизит, НазваниеРеквизита, Отказ) Экспорт
	
	Реквизит = СокрЛ(Реквизит);
	Реквизит = СокрП(Реквизит);
	
	Если Найти(Реквизит, " ") <> 0 Тогда
		СтрокаСообщения = НСтр("ru = 'В реквизите '; ka = 'რეკვიზიტში '") + """" + НазваниеРеквизита + """" + НСтр("ru = ' указан пробел'; ka = ' მითითებულია ჰარი (სიმბოლო "" "")'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,Отказ);
	КонецЕсли;
	
КонецПроцедуры

Функция ПолучениеДанныхССервераИПечать(ТабДок, Организация, НомОнлНСФ, Корректировочная = Неопределено, СтрокаСНомеромСтроки = "",ИзМоейКоманди=ложь) Экспорт
	
	Перем sua;
	Перем f_series;
	Перем f_number;
	Перем operation_dt;
	Перем reg_dt;
	Перем seller_un_id;
	Перем buyer_un_id;
	Перем overhead_no;
	Перем overhead_dt;
	Перем status;
	Перем seq_num_s;
	Перем seq_num_b;
	Перем k_id;
	Перем r_un_id;
	Перем k_type;
	Перем b_s_user_id;
	Перем dec_status;
	Перем ИДПродовца;
	Перем ИДПокупателя;
	Перем su;
	Перем sp;

	user_id = 0;
	invois_id = НомОнлНСФ;

	Если не ЗначениеЗаполнено(invois_id) Тогда
		СтрокаСообщения = СтрокаСНомеромСтроки + НСтр("ka='არ არის შევსებული ""ონლაინ დოკუმენტის ID""';ru='Не заполнен ""ID онлайн счет-фактуры""';en='Not full ""ID online invoice""'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
		Возврат Ложь;
	КонецЕсли;

	Если не ПроверкиПередСоеденением(Организация, su, sp) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Если chek(su, sp, user_id, sua) <> "true" Тогда
		СтрокаСообщения = СтрокаСНомеромСтроки + НСтр("ka='საგადასახადო სერვერთან ავტორიზაციის შეცდომა';ru='Ошибка авторизации с сервером налоговой службы';en='Authorization error with the Internal Revenue Service server'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);	
		Возврат Ложь; 
	Конецесли;
	
	Если get_invoice(user_id, invois_id, su, sp, f_series, f_number, operation_dt, reg_dt, seller_un_id, buyer_un_id, overhead_no, overhead_dt, status, seq_num_s, seq_num_b, k_id, r_un_id, k_type, b_s_user_id, dec_status) <> "true" Тогда
		СтрокаСообщения = СтрокаСНомеромСтроки + НСтр("ru = 'Счет-фактура с онлайн номером : '; ka = 'ანგარიშ-ფაქტურა ონლაინ ნომრით: '") + invois_id + НСтр("ru = ' не найдена'; ka = ' ვერ მოიძებნა'");
		ОбщегоНазначенияКлиентСервер.СообщитьПользователю(СтрокаСообщения,,,,);
        Возврат Ложь;
	КонецЕсли;
	
	Если Корректировочная <> Неопределено Тогда
		Если не ДельтаНСФ.ПроверкаНаСоответствиеКорректировки(k_id, Корректировочная) Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЕсли;
		
	dd = Сред(reg_dt, 9, 2);
	mm = Сред(reg_dt, 6, 2);
	yyyy = Сред(reg_dt, 1, 4);
	
	Если ИзМоейКоманди Тогда
    Макет =  ПолучитьОбщийМакет("ПФ_MXL_МакетСчетФактуры");
	    Иначе
	Макет = ПолучитьОбщийМакет("ПросмотрСФ");
	КонецЕсли; 

	
	ОбластьШапки = Макет.ПолучитьОбласть("Шапка");
	ОбластьТЧ = Макет.ПолучитьОбласть("ТЧ");
	ОбластьПодвал = Макет.ПолучитьОбласть("Подвал");
	ОбластьШапкаНакладные = Макет.ПолучитьОбласть("ШапкаНакладные");
	ОбластьНакладные = Макет.ПолучитьОбласть("Накладные");
	ОбластьПодвалНакладные = Макет.ПолучитьОбласть("ПодвалНакладные");
	
	ОбластьШапки.Параметры.Номер = f_series + ?(f_number = "-1", "" , "-" + f_number);
	
	Если ИзМоейКоманди Тогда
		ОбластьШапки.Параметры.МесяцОп = Формат(ДельтаНСФ.ПереводВДату(operation_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='MMMM'"));
        ОбластьШапки.Параметры.ГодОп = Формат(ДельтаНСФ.ПереводВДату(operation_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='yyyy'"));
		ОбластьШапки.Параметры.МесяцРег = Формат(ДельтаНСФ.ПереводВДату(reg_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='MMMM'"));
        ОбластьШапки.Параметры.ГодРег = Формат(ДельтаНСФ.ПереводВДату(reg_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='yyyy'"));
        ОбластьШапки.Параметры.Число = Формат(ДельтаНСФ.ПереводВДату(reg_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='dd'"));
		ОбластьШапки.Параметры.Статус = ПолучитьСтатус(status);

	Иначе
		ОбластьШапки.Параметры.Месяц = Формат(ДельтаНСФ.ПереводВДату(operation_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='MMMM yyyy'"));
		ОбластьШапки.Параметры.Дата = Формат(ДельтаНСФ.ПереводВДату(reg_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='dd MMMM yyyy'"));
		ОбластьШапки.Параметры.НомерСФ = "#" + invois_id;
	КонецЕсли; 

	
	//ОбластьШапки.Параметры.НомерСФ = "#" + invois_id;
	//ОбластьШапки.Параметры.Месяц = Формат(ДельтаНСФ.ПереводВДату(operation_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='MMMM yyyy'"));
	//ОбластьШапки.Параметры.Дата = Формат(ДельтаНСФ.ПереводВДату(reg_dt), (НСтр("ka='Л=ka_GE;';ru='Л=ru_RU;';en='L = ru_RU;'") + "ДФ='dd MMMM yyyy'"));
	
	НомерПродовца = ДельтаНСФ.get_tin_from_un_id(user_id, seller_un_id, su, sp, ИДПродовца);
	НомерПокупателя = ДельтаНСФ.get_tin_from_un_id(user_id, buyer_un_id, su, sp, ИДПокупателя);
	
	ОбластьШапки.Параметры.Н1 = Сред(НомерПродовца, 1, 1);
	ОбластьШапки.Параметры.Н2 = Сред(НомерПродовца, 2, 1);
	ОбластьШапки.Параметры.Н3 = Сред(НомерПродовца, 3, 1);
	ОбластьШапки.Параметры.Н4 = Сред(НомерПродовца, 4, 1);
	ОбластьШапки.Параметры.Н5 = Сред(НомерПродовца, 5, 1);
	ОбластьШапки.Параметры.Н6 = Сред(НомерПродовца, 6, 1);
	ОбластьШапки.Параметры.Н7 = Сред(НомерПродовца, 7, 1);
	ОбластьШапки.Параметры.Н8 = Сред(НомерПродовца, 8, 1);
	ОбластьШапки.Параметры.Н9 = Сред(НомерПродовца, 9, 1);
	ОбластьШапки.Параметры.Н10 = Сред(НомерПродовца, 10, 1);
	ОбластьШапки.Параметры.Н11 = Сред(НомерПродовца, 11, 1);
	ОбластьШапки.Параметры.П1 = Сред(НомерПокупателя, 1, 1);
	ОбластьШапки.Параметры.П2 = Сред(НомерПокупателя, 2, 1);
	ОбластьШапки.Параметры.П3 = Сред(НомерПокупателя, 3, 1);
	ОбластьШапки.Параметры.П4 = Сред(НомерПокупателя, 4, 1);
	ОбластьШапки.Параметры.П5 = Сред(НомерПокупателя, 5, 1);
	ОбластьШапки.Параметры.П6 = Сред(НомерПокупателя, 6, 1);
	ОбластьШапки.Параметры.П7 = Сред(НомерПокупателя, 7, 1);
	ОбластьШапки.Параметры.П8 = Сред(НомерПокупателя, 8, 1);
	ОбластьШапки.Параметры.П9 = Сред(НомерПокупателя, 9, 1);
	ОбластьШапки.Параметры.П10 = Сред(НомерПокупателя, 10, 1);
	ОбластьШапки.Параметры.П11 = Сред(НомерПокупателя, 11, 1);
	ОбластьШапки.Параметры.НаименованиеПродавца = ИДПродовца;
	ОбластьШапки.Параметры.НаименованиеПокупателя = ИДПокупателя;
	
	ТабДок.Вывести(ОбластьШапки);	
	
	ТаблицаСФ = get_invoice_desc(user_id, invois_id, su, sp, Истина);	
	
	СуммаИтог = 0;
	НДСИтог = 0;
	АкцизИтог = 0;
	Если НЕ ТаблицаСФ = Ложь Тогда
		Для Каждого СтрокаТЗ Из ТаблицаСФ Цикл
			
			ОбластьТЧ.Параметры.Номенклатура = СтрокаТЗ.goods;
			ОбластьТЧ.Параметры.Ед = СтрокаТЗ.g_unit;
			ОбластьТЧ.Параметры.Количество = Число(СтрокаТЗ.g_number);
			ОбластьТЧ.Параметры.Сумма = Число(СтрокаТЗ.full_amount);
			ОбластьТЧ.Параметры.НДС = ?(СтрокаТЗ.drg_amount = -1, "-", Число(СтрокаТЗ.drg_amount));
			ОбластьТЧ.Параметры.Акциз = Число(СтрокаТЗ.aqcizi_amount);
			
			СуммаИтог = СуммаИтог + Число(СтрокаТЗ.full_amount);
			НДСИтог = НДСИтог + ?(СтрокаТЗ.drg_amount = -1, 0, Число(СтрокаТЗ.drg_amount));;
			АкцизИтог = АкцизИтог + Число(СтрокаТЗ.aqcizi_amount);

	        ТабДок.Вывести(ОбластьТЧ);
			
		КонецЦикла;
	КонецЕсли;
	
	ОбластьПодвал.Параметры.СуммаВсего = СуммаИтог;
	ОбластьПодвал.Параметры.НДСВсего = НДСИтог;
	ОбластьПодвал.Параметры.АкцизВсего = АкцизИтог;
	ТабДок.Вывести(ОбластьПодвал);
	
	ТаблицаНакладных = get_ntos_invoices_inv_nos(user_id, invois_id, su, sp);
	ТабДок.Вывести(ОбластьШапкаНакладные);
	Если ТаблицаНакладных.Количество() = 0 Тогда
		////ТабДок.Вывести(ОбластьНакладные);
	Иначе
		Для Каждого СтрокаТЧ ИЗ ТаблицаНакладных Цикл
			ОбластьНакладные.Параметры.НомерНакладной = СтрокаТЧ.overhead_no;
			ОбластьНакладные.Параметры.ДатаНакладной = ПереводВДату(СтрокаТЧ.overhead_dt);
			ТабДок.Вывести(ОбластьНакладные);
		КонецЦикла;
	КонецЕсли;
	ТабДок.Вывести(ОбластьПодвалНакладные);
	
	Возврат Истина;

КонецФункции
	
Функция ПерезаписьНакладныхСчетФактуры(user_id, su, sp, invois_id, ТаблицаНакладныхСервер, ТаблицаНакладныхЛокал) Экспорт
	
	УдаляемыеСтроки = Новый Массив;
	Для Каждого СтрокаНакладная Из ТаблицаНакладныхСервер Цикл
		Если СтрокаНакладная.id = "" Тогда
			Продолжить;
		КонецЕсли;
		НайденаяСтрока = ТаблицаНакладныхЛокал.Найти(СтрокаНакладная.overhead_no, "НомерНакладнойТТН");
		Если НайденаяСтрока = Неопределено Тогда
			Если delete_ntos_invoices_inv_nos(user_id, СтрокаНакладная.id, invois_id, su, sp) <> "true" Тогда
				Возврат Ложь;
			КонецЕсли;
		Иначе
			УдаляемыеСтроки.Добавить(НайденаяСтрока);
		КонецЕсли;
	КонецЦикла;
	
	Для Каждого УдаляемаяСтрока Из УдаляемыеСтроки Цикл
		ТаблицаНакладныхЛокал.Удалить(УдаляемаяСтрока);
	КонецЦикла;
	
	Для Каждого СтрокаДобавления Из ТаблицаНакладныхЛокал Цикл
		Если save_ntos_invoices_inv_nos(invois_id, user_id, СтрокаДобавления.НомерНакладнойТТН, ДатаВремяВСтроку(СтрокаДобавления.ДатаАктивации), su, sp) <> "true" Тогда
			Возврат Ложь;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Истина;
	
КонецФункции

Функция ДатаВСтроку(Дата) Экспорт
	
	Если не ЗначениеЗаполнено(Дата) Тогда
		Возврат "";
	Иначе
		ДатаСтрока = Строка(Формат(Дата, "ДФ='yyyy-MM-dd'"));
		Возврат ДатаСтрока;
	КонецЕсли;
	
КонецФункции
