-- Databricks notebook source
USE CATALOG openfda;
USE SCHEMA openfdaraw;

-- COMMAND ----------

DROP TABLE openfdaraw.3_d_1;

-- COMMAND ----------

DESC TABLE openfdaraw.3_d_1;

-- COMMAND ----------

SELECT * FROM openfdaraw.3_d_1 LIMIT 10;

-- COMMAND ----------

DROP TABLE IF EXISTS openfda.openfdasilver.3_d;
CREATE TABLE IF NOT EXISTS openfda.openfdasilver.3_d
AS
SELECT    concat("This compound's CID is ",id.id.cid," and compound's name is ", c.b,".") as cid,
          concat(" There are ",size(atoms.aid), " attoms in the molecule and their positions in the order are ") as atoms_count,
          transform(atoms.element, x-> CASE 
                                                WHEN x = '8' THEN 'O'
                                                WHEN x = '7' THEN 'N'
                                                WHEN x = '6' THEN 'C'
                                                WHEN x = '1' THEN 'H'
                                                WHEN x = '17' THEN 'CL'
                                                WHEN x = '16' THEN 'S'
                                                WHEN x = '35' THEN 'Br'
                                                WHEN x = '53' THEN 'I'
                                                WHEN x = '30' THEN 'Zn'
                                                WHEN x = '2' THEN 'He'
                                                WHEN x = '3' THEN 'Li'
                                                WHEN x = '4' THEN 'Be'
                                                WHEN x = '5' THEN 'B'
                                                WHEN x = '10' THEN 'NE'
                                                WHEN x = '11' THEN 'Na'
                                                WHEN x = '12' THEN "Mg"
                                                WHEN x = '13' THEN "Al"
                                                WHEN x = '14' THEN "Si"
                                                WHEN x = '15' THEN "P"
                                                WHEN x = '16' THEN "S"
                                                WHEN x = '17' THEN "Cl"
                                                WHEN x = '18' THEN "Ar"
                                                WHEN x = '19' THEN "K"
                                                WHEN x = '20' THEN "Ca"
                                                WHEN x = '26' THEN "Fe"
                                                WHEN x = '28' THEN "N"
                                                WHEN x = '29' THEN "Cu"
                                                WHEN x = '30' THEN "Zn"
                                                WHEN x = '35' THEN "Br"
                                                WHEN x = '53' THEN "I"
                                                ELSE 'X' END) as atoms,
          ". The bonds between them are: " as statement1,
          transform(arrays_zip(bonds.aid1, bonds.aid2, bonds.order), x-> concat(CASE WHEN x.order='1' THEN 'single bond between attom at postion '
                                                                                                WHEN x.order='2' THEN 'double bond between '
                                                                                                WHEN x.order='3' THEN 'triple bond between '
                                                                                                END, x.aid1, " and ", x.aid2))  as bonds,
          transform(arrays_zip(coords.aid[0], coords.conformers.x[0][0], coords.conformers.y[0][0], coords.conformers.z[0][0]),x -> 
          concat (". The 3D x,y,z coordinates of the element at position ", x["0"], " is ", x["1"],", ",x["2"], ", ",x["3"])) as coords,
          concat(
                    ". There are ", count.atom_chiral, " chiral atoms (stereocenters), ",
                    count.atom_chiral_def, " chiral centers, ",
                    count.atom_chiral_undef, " undefined chiral centers, ",
                    count.bond_chiral, " chiral bonds, ",
                    count.bond_chiral_def, " chiral bonds are defined, ",
                    count.bond_chiral_undef, " undefined chiral bonds in the molecule. ",
                    "The molecule is composed of ", count.covalent_unit, " covalent unit. ",
                    "There are ", count.heavy_atom, " heavy atoms and ",
                    count.isotope_atom, " atoms in the molecule with specified isotopes. ",
                    "There are ", count.tautomers, " possible tautomers of the molecule."
                ) as count
FROM openfda.openfdaraw.3_d_1 d
INNER JOIN openfda.openfdaraw.ci_dand_name c ON  c.a = d.id.id.cid

-- COMMAND ----------

SELECT concat (cid,
  atoms_count,
  concat_ws(', ', atoms),
  statement1,
  concat_ws(', ', bonds),
  concat_ws(', ', coords),
  count, '\n'
)
FROM openfda.openfdasilver.3_d 
