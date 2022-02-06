import re
import argparse


filedict = 'dict-test.txt'
dict_ru_en = list()

with open(filedict, "r", encoding="utf-8") as f:
    for str in f.readlines():
        params = re.findall("^(\w+) - (\w+)$", str)
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

with open(filename_en, "w", encoding="utf-8") as f:
    for reg in dict_ru_en:
        for line in lines:
        # old_data = old_data.replace(reg[0][0], reg[0][1])
            pattern1 = '[\s(=]'+reg[0][0]+'[\s);,=]'
            pattern2 = '^'+reg[0][0]+'[\s);,=]'
            pattern3 = '[\s(=]'+reg[0][0]+'$'
            repl = reg[0][1]
            line = re.sub(pattern1, repl, line)
            line = re.sub(pattern2, repl, line)
            line = re.sub(pattern3, repl, line)
            f.write(line)
# with open(filename_en, "w", encoding="utf-8") as f:
#         f.write(old_data)

print ("Done!")