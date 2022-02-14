import re
import argparse

filedict = 'dict.txt'
dict_ru_en = list()

with open(filedict, "r", encoding="utf-8") as f:
    for line in f.readlines():
        if (line.startswith("#") or line == ""):
            continue
        params = re.findall(r"^(\w+) - (\w+)$", line)
        dict_ru_en.append(params)

parser = argparse.ArgumentParser()
parser.add_argument("--f", help="Входящий файл")
parser.add_argument("--o", help="Исходящий файл. Если не указать, то будет запись во входящий файл.")
args = parser.parse_args()


if (args.f):
    filename = args.f

    if (args.o):
        filename_en = args.o
    else:
        filename_en = filename
else:
    filename = 'Module.bsl'
    filename_en = 'Module-en.bsl'

lines = list()
with open(filename, "r", encoding="utf-8") as f:
    lines = f.readlines()

count = 0
with open(filename_en, "w", encoding="utf-8") as f:
    for reg in dict_ru_en:
        for line in lines:
            ru = reg[0][0]
            en = reg[0][1]
            pattern = fr"\b{ru}\b"
            newline = re.sub(pattern, en, line)
            if newline != line:
                count += 1

            lines[lines.index(line)] = newline

    for line in lines:
        f.write(line)

print(f"Done! Repaleces {count} lines")