# 1c-translation-script
Скрипт перевода текстов модулей 1С

В репозитории 2 скрипта выполняющие одинаковую функцию. Один написан python второй на perl, сделал для сравнения удобства разработки.

Оба скрипта содержат словарь, который можно пополнять по аналогии с существующей структурой.
Но есть различия:
В python срабатывает простая замена строк функцией replace, по всему файлу в целом. Комментарии не игнорируются (но вероятность что в коменатрии будет совпадение очень мала).

В perl обработка сделана построчно с пропуском строк с комментариями. Замена выполняется через регулярное выражение s///
Т.к. используются регулярные вырожения в словаре спецсимолы нужно экранировать зноком "\\".

Скрипт обрабатывает один файл.

## Запуск скрипта на python:
python ./translate.py --f ./Module.bsl --o ./Module_traslate.bsl

первый аргумент исходный файл, который нужно перевести, 
второй новый файл в который будет сохранен результат замены 
если второй аргумент не передавать, произойдет замена исходного файла

скачать python:
https://www.python.org/downloads/

## Запуск скрипта на perl:
perl ./translate.py ./Module.bsl ./Module_traslate.bsl

первый аргумент исходный файл, который нужно перевести, 
второй новый файл в который будет сохранен результат замены 
если второй аргумент не передавать, произойдет замена исходного файла

скачать perl:
https://strawberryperl.com

## Примеры запуска
В файле Module.bsl находится модуль на котором можно проверить работу скриптов
```shell
perl ./translate.pl ./Module.bsl ./Module.bsl_en_pl
python ./translate.py --f ./Module.bsl --o ./Module.bsl_en_py
```
linux:
```shell
perl ./translate.pl /home/archer/Work1C/GIT/tools_ui_1c_international/src/ToolsInternational/src/DataProcessors/UT_JSONEditor/Forms/Форма/Module.bsl
python ./translate.py --f /home/archer/Work1C/GIT/tools_ui_1c_international/src/ToolsInternational/src/DataProcessors/UT_JSONEditor/Forms/Форма/Module.bsl
```
windows:
```shell
perl ./translate.pl C:\Work1C\GIT\1c-translation-script\Module.bsl
perl ./translate.pl C:\Work1C\GIT\tools_ui_1c_international\src\ToolsInternational\src\DataProcessors\UT_JSONEditor\Forms\Форма\Module.bsl
python ./translate.py --f C:\Work1C\GIT\1c-translation-script\Module.bsl
```

#Скрипт перевода с использованием словаря
На основе файла с текстом синтаксиса помощника 1С **shcntx_ru** был разработан словарь **dict.txt** (9000 уникальных строк).
Так же в начало словаря были добавлены фразы языка 1С.

Структура файла простая:
```
Область - Region
КонецОбласти - EndRegion
НаСервере - AtServer
НаКлиенте - AtClient
```
Если в начало строки поставить знак "#" данная фраза не будет использоваться.

Для перевода на основе словаря разработан новый скрипт (пока только для языка perl):
**translate-with-dict.pl**

Замена осуществляется универсальным механизмом с помощью регулярного выражения
`s/(?<=[^А-яёЁ]|^)$ru(?=[^А-яёЁ]|$)/$en/g`
т.е. заменяются слова в начале и конце которых отсутствуют буквы.

## Запуск скрипта на perl:
Для работы скрипта в папке с файлом скрипта должен находится словарь dict.txt

`perl translate-with-dict.pl файл_перевода файл_результата`

Первый аргумент исходный файл, который нужно перевести.

Второй новый файл в который будет сохранен результат замены.

Если второй аргумент не передавать, произойдет замена исходного файла.

Скачать perl:
https://strawberryperl.com


## Примеры запуска
linux:
```shell
perl translate-with-dict.pl /home/archer/Work1C/GIT/tools_ui_1c_international/src/ToolsInternational/src/DataProcessors/UT_JSONEditor/Forms/Форма/Module.bsl
```
windows:
```shell
perl translate-with-dict.pl C:\Work1C\GIT\tools_ui_1c_international\src\ToolsInternational\src\DataProcessors\UT_JSONEditor\Forms\Форма\Module.bsl
```

###Обратная связь
Просьба об ошибках сообщать через Issues, а так же отправлять информацию по корректировке словаря так же через Issues или Pull requests.



