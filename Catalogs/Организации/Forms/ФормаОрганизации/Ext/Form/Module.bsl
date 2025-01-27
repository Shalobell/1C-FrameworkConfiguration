﻿
&НаКлиенте
Процедура ВидПриИзменении(Элемент)
	Если Объект.ВидОрганизации = ПредопределенноеЗначение("Перечисление.Вид.ЮридическоеЛицо") Тогда
		Элементы.ГруппаФизическоеЛицо.Видимость = Ложь;
		Объект.ФизическоеЛицо = Неопределено;
		
		Элементы.КодОГРНИП.Видимость = Ложь;
		Объект.КодОГРНИП = неопределено;
		Объект.ДатаРегистрацииОГРН = Неопределено;
		
		Элементы.ГруппаСведенияОРегистрацииИП.Видимость = Ложь;
		Объект.СвидетельствоСерияНомер = Неопределено;
		Объект.СвидетельствоДатаВыдачи = Неопределено;
		
		Элементы.ОГРН.Видимость = Истина;
		Элементы.ИНН.Видимость = Истина;
		Элементы.КПП.Видимость = Истина; 
		
	ИначеЕсли Объект.ВидОрганизации = ПредопределенноеЗначение("Перечисление.Вид.ФизическоеЛицо") Тогда  
		Элементы.ОГРН.Видимость = Ложь;
		Объект.ОГРН = неопределено;
		
		Элементы.ИНН.Видимость = Ложь; 
		объект.ИНН = Неопределено;
		
		Элементы.КПП.Видимость = Ложь;
		Объект.КПП = Неопределено;
		
		
		
		Элементы.ГруппаФизическоеЛицо.Видимость = Истина;
		Элементы.КодОГРНИП.Видимость = Истина;
		Элементы.ГруппаСведенияОРегистрацииИП.Видимость = Истина;

	КонецЕсли;
КонецПроцедуры

 &НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ЭтоАдресВременногоХранилища(СсылкаНаКартинку) Тогда
		
		ФайлКартинки = ПолучитьИзВременногоХранилища(СсылкаНаКартинку);
		
		ТекущийОбъект.Картинка = Новый ХранилищеЗначения(ФайлКартинки);

		
		УдалитьИзВременногоХранилища(СсылкаНаКартинку);
		
		СсылкаНаКартинку = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Картинка");
		
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка) 
	
	
	СсылкаНаКартинку = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Картинка");
	Элементы.СсылкаНаКартинку.РазмерКартинки = РазмерКартинки.АвтоРазмер;
КонецПроцедуры


#Область РаботаСКартинкой

&НаКлиенте
Процедура СсылкаНаКартинкуНажатие(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь; 
	Режим = РежимДиалогаВыбораФайла.Открытие;
	
	ДиалогОткрытия = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытия.МножественныйВыбор = Ложь;
	
	
	ДиалогОткрытия.ПолноеИмяФайла = Неопределено;	
	ДиалогОткрытия.Фильтр = "Файл Jpg (*.jpg)|*.jpg";
	
	
	ДиалогОткрытия.Заголовок = "Выберите файл для загрузки"; 
	
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПослеЗагрузкиФайла", ЭтаФорма); 
	ДиалогОткрытия.Показать(ОписаниеОповещения);
	
	
КонецПроцедуры  

&НаКлиенте
Процедура ПослеЗагрузкиФайла(ВыбранныйФайл, ДополнительныеПараметры) Экспорт 
	Если ВыбранныйФайл = Неопределено Тогда 
		Возврат;
	КонецЕсли;
	
	СсылкаНаКартинку = ВыбранныйФайл[0];
     
	
	ОписаниеОповещенияОЗавершении = Новый ОписаниеОповещения("ОписаниеОповещенияОЗавершении", ЭтаФорма);
	
	НачатьПомещениеФайлаНаСервер(ОписаниеОповещенияОЗавершении, , , , СсылкаНаКартинку, УникальныйИдентификатор);
	

	
КонецПроцедуры

&НаКлиенте 
Процедура ОписаниеОповещенияОЗавершении(ОписаниеПереданногоФайла, ДополнительныеПраметры) Экспорт 
	Если ПустаяСтрока(СсылкаНаКартинку) Тогда 
		 Возврат;
	 КонецЕсли; 
	 
	 СсылкаНаКартинку = ОписаниеПереданногоФайла.Адрес;
	 Модифицированность = Истина;
 КонецПроцедуры
 


&НаКлиенте
Процедура УдалитьИзображение(Команда)
	ЭтотОбъект.СсылкаНаКартинку = Неопределено;
	УдалениеИзображения();
КонецПроцедуры 

&НаСервере
Процедура УдалениеИзображения()
	
    ОчисткаХранилища = РеквизитФормыВЗначение("Объект");
   	ОчисткаХранилища.Картинка = Новый ХранилищеЗначения(Неопределено);
    ОчисткаХранилища.Записать();
   	ЗначениеВРеквизитФормы(ОчисткаХранилища, "Объект");	
	
КонецПроцедуры

#КонецОбласти

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ВосстановитьЗначенияРеквизитовФормы();
	
	ВидПриИзменении(Неопределено);
КонецПроцедуры

 &НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	СохранитьЗначенияРеквизитовФормы();
КонецПроцедуры


#Область РаботаСРеквизитамиФормы  

&НаСервере
Процедура СохранитьЗначенияРеквизитовФормы() 
	Если Не Объект.Ссылка.Пустая() Тогда
		Настройки = Новый Соответствие;
		
		Настройки.Вставить("ЮридическийАдрес", ЮридическийАдрес);
		Настройки.Вставить("ФактическийАдрес", ФактическийАдрес);
		Настройки.Вставить("ПочтовыйАдрес", ПочтовыйАдрес);
		Настройки.Вставить("ТелефонОрганизации", ТелефонОрганизации);
		Настройки.Вставить("ФаксОрганизации", ФаксОрганизации);
		Настройки.Вставить("EmailОрганизации", EmailОрганизации);
		Настройки.Вставить("ДругаяИнформацияОрганизации", ДругаяИнформацияОрганизации);
		
		СерверныеПроцедуры.СохранитьЗначенияРеквизитов(Объект.Ссылка, Настройки);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ВосстановитьЗначенияРеквизитовФормы()
	ЗначенияРеквизитов = СерверныеПроцедуры.ВосстановитьЗначенияРеквизитов(Объект.Ссылка);
	
	Если ТипЗнч(ЗначенияРеквизитов) = Тип("Соответствие") Тогда
		ЮридическийАдрес = ЗначенияРеквизитов.Получить("ЮридическийАдрес");
		ФактическийАдрес = ЗначенияРеквизитов.Получить("ФактическийАдрес");
		ПочтовыйАдрес = ЗначенияРеквизитов.Получить("ПочтовыйАдрес");
		ТелефонОрганизации = ЗначенияРеквизитов.Получить("ТелефонОрганизации");
		ФаксОрганизации = ЗначенияРеквизитов.Получить("ФаксОрганизации");
		EmailОрганизации = ЗначенияРеквизитов.Получить("EmailОрганизации");
		ДругаяИнформацияОрганизации = ЗначенияРеквизитов.Получить("ДругаяИнформацияОрганизации");
	КонецЕсли;
КонецПроцедуры


#КонецОбласти