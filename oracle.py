import csv
import cx_Oracle
db = cx_Oracle.connect('books_admin/brekeke@192.168.56.111/xe')
cursor = db.cursor()
f = open("export.csv", "w")
writer = csv.writer(f, lineterminator="\n", quoting=csv.QUOTE_NONNUMERIC)
r = cursor.execute("SELECT book_id, title, author_last_name, author_first_name, rating FROM books Vw")
#r = cursor.execute("SELECT IDPPRI, NAZEV, AKT_CENA, AKT_KODTFAZ, OSCISLO, PRIJMENI, ZUSTUCHO, CENAZPOS, KODNEM, ZKRADR, OPEX, CAPEX, ZALREZ, MESUHR, MESZAUCT, MESUHRZAL, VPLANU FROM BUILDCMP.U_PRODPRIP Vw")
for row in cursor:
	writer.writerow(row)
f.close()

