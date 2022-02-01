use strict;
use utf8;

my @dict = (
    { ru => 'Процедура ', en => 'Procedure '}, 
    { ru => 'КонецПроцедуры', en => 'EndProcedure'}, 

    { ru => 'Функция ', en => 'Function '}, 
    { ru => 'КонецФункции', en => 'EndFunction'}, 

    { ru => '#Область', en => '#Region'}, 
    { ru => '#КонецОбласти', en => '#EndRegion'}, 

    { ru => '&НаСервере', en => '&AtServer'}, 
    { ru => '&НаКлиенте', en => '&AtClient'},

    { ru => 'Истина', en => 'True'}, 
    { ru => 'Ложь', en => 'False'}, 

    { ru => 'Если ', en => 'If '}, 
    { ru => 'Тогда', en => 'Then'}, 
    { ru => 'КонецЕсли;', en => 'EndIf;'}, 
    { ru => 'ИначеЕсли ', en => 'ElsIf '}, 
    { ru => 'Иначе', en => 'Else'}, 
    { ru => 'Не ', en => 'Not '}, 
    { ru => ' И ', en => ' And '}, 
    { ru => ' Или ', en => ' Or '}, 

    { ru => 'Для ', en => 'For '}, 
    { ru => ' Каждого ', en => ' Each '}, 
    { ru => ' Из ', en => ' In '}, 
    
    { ru => ' Цикл', en => ' Do'}, 
    { ru => 'КонецЦикла;', en => 'EndDo;'}, 
    { ru => 'Продолжить;', en => 'Continue;'}, 
    { ru => 'Прервать;', en => 'Breack;'}, 

    { ru => '\(Отказ\)', en => '(Cancel)'}, 
    { ru => '\(Отказ', en => '(Cancel'}, 
    { ru => ' Отказ,', en => ' Cancel,'}, 
    { ru => 'Возврат;', en => 'Return;'}, 
    { ru => 'Возврат ', en => 'Return '},  

    { ru => 'Элементы.', en => 'Items.'}, 
    { ru => '\(Элемент\)', en => '(Item)'}, 

    { ru => 'Новый Структура', en => 'New Structure'}, 
    { ru => 'Новый Соответствие', en => 'New Map'}, 
    { ru => 'Новый Массив', en => 'New Array'}, 

    { ru => 'Попытка', en => 'Try'}, 
    { ru => 'Исключение', en => 'Except'}, 
    { ru => 'КонецПопытки;', en => 'EndTry;'}, 
    { ru => 'ВызватьИсключение\(', en => 'Raise('}, 
    { ru => 'НачалоТранзакции', en => 'BeginTransaction'}, 
    { ru => 'ЗафиксироватьТранзакцию', en => 'CommitTransaction'}, 
    { ru => 'ОтменитьТранзакцию', en => 'RollbackTransaction'}, 

    #Операторы
    { ru => 'Новый ', en => 'New '}, 
    { ru => 'НСтр', en => 'NStr'}, 
    { ru => 'Неопределено', en => 'Undefined'}, 
    { ru => 'БлокировкаДанных', en => 'DataLock'}, 
    { ru => 'Метаданные', en => 'Metadata'}, 
    { ru => 'ОписаниеОповещения', en => 'NotifyDescription'}, 
    { ru => 'Сообщить\(', en => 'Message('}, 

    { ru => ' Запрос', en => ' Query'}, 
    { ru => 'ТекстЗапроса', en => 'QueryText'}, 
    { ru => 'УстановитьПараметр\(', en => 'SetParameter('}, 
    { ru => 'Выполнить\(\)', en => 'Execute()'}, 
    { ru => 'Выгрузить\(\)', en => 'Unload()'}, 

    { ru => '.Добавить\(', en => '.Add('}, 
    { ru => '.Вставить\(', en => '.Insert('}, 
    { ru => '.Найти\(', en => '.Find('}, 
    { ru => '.Очистить\(\)', en => '.Clear()'}, 
    { ru => 'НайтиПоТипу\(', en => 'FindByType('}, 
    { ru => 'Тип\(', en => 'Type('}, 
    { ru => 'ТипЗнч\(', en => 'TypeOf('}, 
    { ru => 'ОписаниеТипов', en => 'TypeDescription'}, 
    { ru => 'УстановитьПривилегированныйРежим', en => 'SetPrivilegedMode'}, 
    { ru => 'ЗаписьЖурналаРегистрации', en => 'WriteLogEvent'}, 
    { ru => 'ЗаполнитьЗначенияСвойств', en => 'FillPropertyValues'}, 
    { ru => 'Символы.ПС', en => 'Chars.LF'}, 

    { ru => '.Свойство\(', en => '.Property('}, 
    { ru => 'Перем ', en => 'Var '}, 
    { ru => 'ЭтотОбъект', en => 'ThisObject'}, 

    { ru => 'РеквизитФормыВЗначение', en => 'FormAttributeToValue'}, 
    { ru => 'ПолучитьМакет\(', en => 'GetTemplate('}, 
    { ru => 'ПолучитьИмяВременногоФайла', en => 'GetTempFileName'}, 
    { ru => 'СоздатьКаталог\(', en => 'CreateDirectory('}, 
    { ru => 'ОткрытьПотокДляЧтения', en => 'OpenStreamForRead'}, 
    { ru => 'ЧтениеZipФайла', en => 'ZipFileReader'}, 
    { ru => 'ИзвлечьВсе\(', en => 'ExtractAll('}, 
    { ru => 'РежимВосстановленияПутейФайловZIP', en => 'ZIPRestoreFilePathsMode'}, 
    { ru => 'НайтиФайлы\(', en => 'FindFiles('}, 
    { ru => 'ПолучитьРазделительПути', en => 'GetPathSeparator'}, 
    { ru => 'СтрЗаменить\(', en => 'StrReplace('}, 
    { ru => 'ДвоичныеДанные\(', en => 'BinaryData('}, 
    { ru => 'ПоместитьВоВременноеХранилище', en => 'PutToTempStorage'}, 
    { ru => 'ПолучитьИзВременногоХранилища', en => 'GetFromTempStorage'}, 
    { ru => 'ЗначениеЗаполнено\(', en => 'ValueIsFilled('}, 
    { ru => 'Модифицированность', en => 'Modified'}, 
    { ru => '', en => ''},     

    #События формы
    { ru => 'ПриСозданииНаСервере\(Отказ, СтандартнаяОбработка\)', en => 'OnCreateAtServer(Cancel, StandardProcessing)'}, 
    { ru => 'ПриОткрытии\(Отказ\)', en => 'OnOpen(Cancel)'}, 
    { ru => 'СтандартнаяОбработка', en => 'StandardProcessing'}, 
    { ru => '.Видимость', en => '.Visible'}, 
    { ru => '.Доступность', en => '.Enabled'}, 
    { ru => 'ПоказатьВопрос\(', en => 'ShowQueryBox('}, 
    { ru => 'РежимДиалогаВопрос', en => 'QuestionDialogMode'}, 
    { ru => 'ПередЗакрытием\(', en => 'BeforeClose('}, 
    { ru => 'ЗавершениеРаботы,', en => 'Exit,'}, 
    { ru => 'ТекстПредупреждения,', en => 'WarningText,'}, 
    { ru => 'НачатьУдалениеФайлов', en => 'BeginDeletingFiles'}, 
    { ru => 'ПодключитьОбработчикОжидания', en => 'AttachIdleHandler'}, 
    { ru => 'Закрыть\(', en => 'Close('}, 
    { ru => '', en => ''}, 
    { ru => '', en => ''}, 
    #Переменные
    { ru => ' Параметры.', en => ' Parameters.'}, 
    { ru => '=Параметры.', en => '=Parameters.'}, 
    { ru => 'ДополнительныеПараметры', en => 'AdditionalParameters'}, 
    
    { ru => 'УникальныйИдентификатор', en => 'UUID'}, 
    { ru => 'ЭтаФорма', en => 'ThisForm'}, 
    { ru => '\(Команда\)', en => '(Command)'}, 
    { ru => ' Экспорт', en => ' Export'}, 
    { ru => 'Формат\(', en => 'Format('}, 

);

my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my @lines;
while (my $line = <$fh>) {
    push(@lines, $line);
}
close($fh);

foreach my $reg (@dict) {
    if ($reg->{ru}  eq '' || $reg->{en} eq '') {
        next;
    }
    
    foreach my $line (@lines) {
        unless ($line =~ /^\//) {
            my $old_line = $line;
            $line =~ s/$reg->{ru}/$reg->{en}/g;
            if ($line ne $old_line) {
                print "$old_line -> $line";
            }
        }
    }
}

my $filename_en = '';
if ($ARGV[1]) {
    $filename_en = $ARGV[1];    
} else {
    $filename_en = $filename;
}

open(my $fw, '>:encoding(UTF-8)', $filename_en) 
    or die "Could not open file '$filename' $!";

foreach my $line (@lines) {
    print $fw $line;
}
close($fw);
print "Done\n"