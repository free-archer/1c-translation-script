import re
import argparse

dict_ru_en = [
    { "ru": "Процедура ", "en": "Procedure "}, 
    { "ru": "КонецПроцедуры", "en": "EndProcedure"}, 

    { "ru": "Функция ", "en": "Function "}, 
    { "ru": "КонецФункции", "en": "EndFunction"}, 

    { "ru": "#Область", "en": "#Region"}, 
    { "ru": "#КонецОбласти", "en": "#EndRegion"}, 

    { "ru": "&НаСервере", "en": "&AtServer"}, 
    { "ru": "&НаКлиенте", "en": "&AtClient"},

    { "ru": "Истина", "en": "True"}, 
    { "ru": "Ложь", "en": "False"}, 

    { "ru": "Тогда", "en": "Then"}, 
    { "ru": "КонецЕсли;", "en": "EndIf;"}, 
    { "ru": "ИначеЕсли ", "en": " ElsIf "}, 
    { "ru": "Иначе ", "en": "Else "}, 
    { "ru": "Если ", "en": "If "}, 
    { "ru": "Не ", "en": "Not "}, 
    { "ru": " И ", "en": " And "}, 
    { "ru": " Или ", "en": " Or "}, 

    { "ru": "Для ", "en": "For "}, 
    { "ru": " Каждого ", "en": " Each "}, 
    { "ru": " Из ", "en": " In "}, 
    
    { "ru": " Цикл", "en": " Do"}, 
    { "ru": "КонецЦикла;", "en": "EndDo;"}, 
    { "ru": "Продолжить;", "en": "Continue;"}, 
    { "ru": "Прервать;", "en": "Breack;"}, 

    #{ "ru": "Отказ", "en": "Cancel"}, 
    { "ru": "Возврат;", "en": "Return;"}, 
    { "ru": "Возврат ", "en": "Return "}, 

    { "ru": "Элементы.", "en": "Items."}, 
    #{ "ru": "Элемент", "en": "Item"}, 

    { "ru": "Новый Структура", "en": "New Structure"}, 
    { "ru": "Новый Соответствие", "en": "New Map"}, 
    { "ru": "Новый Массив", "en": "New Array"}, 

    { "ru": "Попытка", "en": "Try"}, 
    { "ru": "Исключение", "en": "Except"}, 
    { "ru": "КонецПопытки;", "en": "EndTry;"}, 
    { "ru": "ВызватьИсключение(", "en": "Raise("}, 
    { "ru": "НачалоТранзакции", "en": "BeginTransaction"}, 
    { "ru": "ЗафиксироватьТранзакцию", "en": "CommitTransaction"}, 
    { "ru": "ОтменитьТранзакцию", "en": "RollbackTransaction"}, 

    #Операторы
    { "ru": "Новый ", "en": "New "}, 
    { "ru": "НСтр", "en": "NStr"}, 
    { "ru": "Неопределено", "en": "Undefined"}, 
    { "ru": "БлокировкаДанных", "en": "DataLock"}, 
    { "ru": "Метаданные", "en": "Metadata"}, 
    { "ru": "ОписаниеОповещения", "en": "NotifyDescription"}, 
    { "ru": "Сообщить(", "en": "Message("}, 

    { "ru": " Запрос", "en": " Query"}, 
    { "ru": "ТекстЗапроса", "en": "QueryText"}, 
    { "ru": "УстановитьПараметр(", "en": "SetParameter("}, 
    { "ru": "Выполнить()", "en": "Execute()"}, 
    { "ru": "Выгрузить()", "en": "Unload()"}, 

    { "ru": ".Добавить(", "en": ".Add("}, 
    { "ru": ".Вставить(", "en": ".Insert("}, 
    { "ru": ".Найти(", "en": ".Find("}, 
    { "ru": ".Очистить()", "en": ".Clear()"}, 
    { "ru": "НайтиПоТипу(", "en": "FindByType("}, 
    { "ru": "Тип(", "en": "Type("}, 
    { "ru": "ТипЗнч(", "en": "TypeOf("}, 
    { "ru": "ОписаниеТипов", "en": "TypeDescription"}, 
    { "ru": "УстановитьПривилегированныйРежим", "en": "SetPrivilegedMode"}, 
    { "ru": "ЗаписьЖурналаРегистрации", "en": "WriteLogEvent"}, 
    { "ru": "ЗаполнитьЗначенияСвойств", "en": "FillPropertyValues"}, 

    #События формы
    { "ru": "ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)", "en": "OnCreateAtServer(Cancel, StandardProcessing)"},
    { "ru": "ПриОткрытии(Отказ)", "en": "OnOpen(Cancel)"},

    { "ru": "Символы.ПС", "en": "Chars.LF"},
]

parser = argparse.ArgumentParser()
parser.add_argument("--f", help="Входящий файл")
parser.add_argument("--o", help="Исходящий файл. Если не указать, то будет запись во входящий файл.")
args = parser.parse_args()



filename = args.f

if (args.o):
    filename_en = args.o
else:
    filename_en = filename

lines = list()
with open(filename, "r", encoding="utf-8") as f:
    old_data = f.read()

for reg in dict_ru_en:
    if (reg["ru"] == "" or reg["en"] == ""):
        continue

    old_data = old_data.replace(reg["ru"], reg["en"])
      
with open(filename_en, "w", encoding="utf-8") as f:
        f.write(old_data)

print ("Done!")