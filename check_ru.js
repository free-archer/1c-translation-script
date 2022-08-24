"use strict"

const process = require('process')
const readline = require('readline');
const fs = require('fs');

let [,, filename_en] = process.argv

if (filename_en == undefined) {
    filename_en = "Module_en.bsl"
}

if (fs.existsSync(filename_en) == false) {
    console.log("Файл не существует!")
    process.exit()
}

const Lines = fs.readFileSync(filename_en, 'utf8').split("\n")

const re = RegExp("[А-яёЁ]")
for (let i=0; i<=Lines.length; i++) {
    let line = Lines[i]
    if (re.test(line)) {
        console.log(`${i} - ${line}`)
    }
}