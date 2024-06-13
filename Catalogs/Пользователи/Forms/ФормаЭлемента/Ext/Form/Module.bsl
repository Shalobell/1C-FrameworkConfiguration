﻿



&НаКлиенте
Процедура ИзменитьПарольНажатие(Элемент)
	Элементы.ИзменитьПароль.Видимость = Ложь;
	Элементы.Пароль.Видимость = Истина;
	Элементы.ПодтверждениеПароля.Видимость = Истина;
	Элементы.КомандаУстановить.Видимость = Истина;
КонецПроцедуры

&НаКлиенте
Процедура КомандаУстановить(Команда)
	Если ПодтверждениеПароля = Пароль И ЗначениеЗаполнено(Пароль) Тогда
		Элементы.Пароль.Видимость = Ложь;
		Элементы.ПодтверждениеПароля.Видимость = Ложь;
		Элементы.КомандаУстановить.Видимость = Ложь;
		Элементы.ИзменитьПароль.Видимость = Истина;
		
		Элементы.НадписьПарольУстановлен.Заголовок = "Пароль установлен";
		Элементы.НадписьПарольУстановлен.ЦветТекста = WebЦвета.Зеленый;
		
	Иначе
		Сообщить("Поля не совпадают !!!");
	КонецЕсли;
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	РолиПользователя = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(Объект.Ссылка.УникальныйИдентификатор()).Роли;
КонецПроцедуры

