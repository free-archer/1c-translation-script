const process = require('process')
const readline = require('readline');
const fs = require('fs');

const time_start = performance.now()

const stdin = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

const filedict = 'dict.txt'
let dict_ru_en = []

let [,, filename, filename_en] = process.argv

if (filename== "-i") {
    stdin.question("Введите имя файла: \n", function(answer) {
        filename = answer
        filename_en = filename

        traslate()
      
        stdin.close();
      });

} else if (filename == undefined) {
    filename = "Module.bsl"
    filename_en = "Module_en.bsl"

    traslate()
} else if (filename_en == undefined) {
    filename_en = filename

    traslate()
} else {
    traslate()
}


function traslate() {
    if (fs.existsSync(filedict) == false) {
        console.log("Файл словаря не существует!")
        process.exit()
    }

    if (fs.existsSync(filename) == false) {
        console.log("Исходный файл не существует!")
        process.exit()
    }

    console.log("Исходный файл: %s", filename)
    console.log("Файл результата: %s", filename_en)

    const Lines = fs.readFileSync(filedict, 'utf8').split("\n")
    const dict_ru_en = []
    for (let line of Lines) {
        
        if (line.startsWith("#") || line.length == 0) {
            continue
        }  
        
        let result = line.match(/^([А-я]+) - ([A-z]+)$/i)
        
        if (result == null || result.length < 3) {
            continue
        }

        const dict = {}
        
        dict.ru = result[1]
        dict.en = result[2]

        dict_ru_en.push(dict)

    }

    let Text = fs.readFileSync(filename, 'utf8')

    //Переведем области отдельно, т.к. есть дубль в словаре
    Text = Text.replace("#Область", "#Region")
    Text = Text.replace("#КонецОбласти", "#EndRegion")    

    for (const reg of dict_ru_en) {
        let pattern = new RegExp('\\b' + reg.ru + '\\b', 'gm')

        Text = Text.replaceAll(reg.ru, reg.en)
    }
  
    fs.writeFileSync(filename_en, Text)

    //console.log(Text)

    const time_end = performance.now()
    console.log('выполнено! Время выполнения = %s ms', time_end-time_start)        

    process.exit()

}

