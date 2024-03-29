# Скрипт перевода текстов модулей 1С
Скрипт перевода текстов модулей 1С

В репозитории 2 скрипта выполняющие одинаковую функцию. Один написан python второй на perl, сделал для сравнения удобства разработки.

Оба скрипта работают на основе словаря, аналогичным образом с использованием регулярного выражения.

## Словарь
На основе файла с текстом синтаксиса помощника 1С **shcntx_ru** был разработан словарь **dict.txt** (~8000 уникальных строк).

Так же в начало словаря были добавлены фразы из языка 1С, которые не отражены в синтакссинтакс-помощнике.

Структура словаря простая:
```
Область - Region
КонецОбласти - EndRegion
НаСервере - AtServer
НаКлиенте - AtClient
```

## Запуск скриптов
Синтаксис командной строки у скриптов одинаковый:

`python translate.py файл_перевода файл_результата`

`perl translate.pl файл_перевода файл_результата`

первый аргумент **файл_перевода** исходный файл, который нужно перевести,

второй **файл_результата** новый файл в который будет сохранен результат замены 
(если второй аргумент не передавать, произойдет замена исходного файла)

если скрипт запустить с ключем **-i** будет открыт интерактивный ввод, 
куда можно вставить путь к файлу, который нужно перевести

## Примеры запуска на python:
`python ./translate.py ./Module.bsl ./Module_traslate.bsl`

`python ./translate.py ./Module.bsl `

`python ./translate.py -i`


скачать python:

https://www.python.org/downloads/

## Примеры запуска скрипта на perl:
`perl ./translate.pl ./Module.bsl ./Module_traslate.bsl`

`perl ./translate.pl ./Module.bsl `

`perl ./translate.pl -i`


скачать perl:

https://strawberryperl.com

# Скрипт проверки
Так же разработан скрипт, который проверяет наличие русских букв в файле:

`python check_ru.py файл_проверки`

`perl check_ru.pl файл_проверки`

`node check_ru.js файл_проверки`

С perl есть проблема, точнее проблема консоли windows с perl - кириллица отображается некорректно. На Linux проблем с кириллицей нет.

Если вы используете Windows, то предпочтительнее пользоваться скриптами на python.



### Обратная связь
Просьба об ошибках сообщать через Issues, а так же отправлять информацию по корректировке словаря через Issues или Pull requests.

# Реализации на других языках
Больше для любопытства и изучения нового реализовал алгоритм на других языках.
Алгоритм и параметры командной строки у всех одинаковые.

## Реализация на C# находится в папке **sharp**
Выполнить можно с помощью команды: 
`dotnet run`
В релизах лежит испольняемый файл для Linux.
https://github.com/free-archer/1c-translation-script/releases/download/v1.0/sharptraslate

## Реализация на Java Script находится в файле translate.js
Сделал реализацию на Node.js. Чтобы посмотреть, как работает Node и попрактиковаться в **translate.js**.

Механизм работы скрипта и ключи общие. Перед запуском нужно установить Node.js https://nodejs.org/en/download/

### Примеры запуска на Node:
`node ./translate.js ./Module.bsl ./Module_traslate.bsl`

`node ./translate.js ./Module.bsl `

`node ./translate.js -i`

# Производительность
Сделал замеры производительности. 
Переводился файл из 5000 строк.
Результаты меня немного удивили:


- python - 29 секунд
- perl - 37 секунд
- c# - 1,352 секунды (1352 милисекунды)
- node - 0,558 секунды (558 милисекунды)
