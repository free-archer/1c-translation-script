# 1c-translation-script
Скрипт перевода текстов модулей 1С

В репозитории 2 скрипта выполняющие одинаковую функцию. Один написан python второй на perl, сделал для сравнения удобства разработки.

Оба скрипта работают на основе словаря, аналогичным образом с использованием регулярного выражения.

## словарь
Словарь создан на основе файла с текстом синтаксиса помощника 1С **shcntx_ru** был разработан словарь **dict.txt** (~8000 уникальных строк).

Так же в начало словаря были добавлены фразы из языка 1С, которые не отражены в синтакссинтакс-помощнике.

Структура файла простая:
```
Область - Region
КонецОбласти - EndRegion
НаСервере - AtServer
НаКлиенте - AtClient
```

Скрипт обрабатывает один файл.

## Запуск скриптов
Синтаксис коммандной строки у скриптов одинаковый

первый аргумент исходный файл, который нужно перевести, 
второй новый файл в который будет сохранен результат замены 
если второй аргумент не передавать, произойдет замена исходного файла

если скрипт запустить с ключем "-i" будет открыт интерактивный ввод, 
куда можно вставить путь к файлу, который нужно перевести

## Запуск скрипта на python:
`python translate.py файл_перевода файл_результата`

`python ./translate.py ./Module.bsl ./Module_traslate.bsl`

`python ./translate.py ./Module.bsl `

`python ./translate.py -i`


скачать python:

https://www.python.org/downloads/

## Запуск скрипта на perl:
`perl translate.pl файл_перевода файл_результата`

`perl ./translate.pl ./Module.bsl ./Module_traslate.bsl`

`perl ./translate.pl ./Module.bsl `

`perl ./translate.pl -i`


скачать perl:

https://strawberryperl.com

### Обратная связь
Просьба об ошибках сообщать через Issues, а так же отправлять информацию по корректировке словаря через Issues или Pull requests.
