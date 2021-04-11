set echo off
set linesize 32767
set pagesize 0
set trimspool on
set trimout on
set feedback off
set colsep '|'
SELECT
 book_id,
 title,
 author_last_name,
 author_first_name,
 rating
FROM
 books Vw;
-- SELECT IDPPRI, NAZEV, AKT_CENA, AKT_KODTFAZ, OSCISLO, PRIJMENI, ZUSTUCHO, CENAZPOS, KODNEM, ZKRADR, OPEX, CAPEX, ZALREZ, MESUHR, MESZAUCT, MESUHRZAL, VPLANU
-- FROM BUILDCMP.U_PRODPRIP Vw;
