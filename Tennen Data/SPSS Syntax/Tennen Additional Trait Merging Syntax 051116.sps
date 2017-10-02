***************************MERGING TRAIT DATASETS.
********Two differences between "Year 1 Initial Complete File.sav" and "Year 1 Initial Complete File_prep4merge.sav".
********1) I added "w1", "w2", "w3", and "w4" in front of the variables "dt_comp", "tm_comp", and "lastsubm".
********to allow for merging of these variables.
********2) I changed the width and decimals to be 4 and 0 (respectively) for each file's "uid" variable to allow for merging.

***SORT ALL DATASETS BY ID.

*YEAR 1 FILE NAME:  "Year 1 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet1.
SORT CASES BY uid(A).

*YEAR 2 FILE NAME:  "Year 2 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet2.
SORT CASES BY uid(A).

*YEAR 3 FILE NAME:  "Year 3 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet3.
SORT CASES BY uid(A).

*YEAR 4 FILE NAME:  "Year 4 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet4.
SORT CASES BY uid(A).

***MERGING STARTING WITH FILE NAME:  "Year 1 Initial Complete File_prep4merge.sav".
***SAVE FILE AS NEW NAME:  "All Years Initial Complete File.sav"

***MERGE YEAR 2 FILE NAME:  "Year 2 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet2'
  /BY uid.
EXECUTE.

***MERGE YEAR 3 FILE NAME:  "Year 3 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet3'
  /BY uid.
EXECUTE.

***MERGE YEAR 4 FILE NAME:  "Year 4 Initial Complete File_prep4merge.sav".
DATASET ACTIVATE DataSet1.
MATCH FILES /FILE=*
  /TABLE='DataSet4'
  /BY uid.
EXECUTE.
