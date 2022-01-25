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

    #{ ru => 'Отказ', en => 'Cancel'}, 
    { ru => 'Возврат;', en => 'Return;'}, 
    { ru => 'Возврат ', en => 'Return '},  

    { ru => 'Элементы.', en => 'Items.'}, 
    #{ ru => 'Элемент', en => 'Item'}, 

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
    foreach my $line (@lines) {
        unless ($line =~ /^\//) {
            $line =~ s/$reg->{ru}/$reg->{en}/;
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