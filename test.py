import csv
import openpyxl

wb = openpyxl.Workbook()
ws = wb.active

f = open('/appl/volume/vystup.csv')
reader = csv.reader(f, delimiter='|')
for row in reader:
	ws.append(row)
f.close()

wb.save('/appl/volume/vystup.xlsx')

