﻿Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)

	ТекПользователь = Справочники.Пользователи.НайтиПоНаименованию(ИмяПользователя());

	Если ТекПользователь.Пустая() Тогда
	НовПользователь = Справочники.Пользователи.СоздатьЭлемент();
	НовПользователь.Наименование = ИмяПользователя();

	НовПользователь.Записать();
	ТекПользователь = НовПользователь.Ссылка;
	КонецЕсли;

	ПараметрыСеанса.ТекущийПользователь = ТекПользователь; 

КонецПроцедуры