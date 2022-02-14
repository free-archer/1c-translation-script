import re
import sys

print(sys.argv)

if len(sys.argv) != 2:
    filename = "Module.bsl"
else:
    filename = sys.argv[1]

print(filename)

with open(filename, 'r', encoding="utf-8") as file:
    lines = file.readlines()

col = 0
ind = 1
for line in lines:
    ind += 1
    if not re.search('[А-яёЁ]', line):
        continue
    print(f"{ind} - {line.rstrip()}")
    col += 1

print(f"Found {col} lines")
