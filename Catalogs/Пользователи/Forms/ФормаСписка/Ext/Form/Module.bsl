﻿
&НаКлиенте
Процедура ПриОткрытии(Отказ) 
	Отказ = Истина;
	ПодключитьВнешнююОбработкуНаСервере();
	ОткрытьФорму("ВнешняяОбработка.StandardUserList.Форма");
КонецПроцедуры

&НаСервере
Процедура ПодключитьВнешнююОбработкуНаСервере()
    ВнешниеОбработки.Подключить("v8res://mngbase/StandardUserList.epf", "StandardUserList", false);
КонецПроцедуры