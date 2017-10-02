
*YEAR 1 Dataset. 

*Sorting original daily data by UID and Day of study. 
DATASET ACTIVATE DataSet4.
SORT CASES BY uid(A) studyday(A).

*Sorting additional daily data by UID and Day of study.
DATASET ACTIVATE DataSet3.
SORT CASES BY uid(A) studyday(A).

*Merging the sorted files now that they're sorted. 
DATASET ACTIVATE DataSet4.
MATCH FILES /FILE=*
  /TABLE='DataSet3'
  /BY uid studyday.
EXECUTE.

*YEAR 2.
*Sorting original daily data by UID and Day of study.
DATASET ACTIVATE DataSet6.
SORT CASES BY uid(A) studyday(A).

*Sorting additional daily data by UID and Day of study.
DATASET ACTIVATE DataSet5.
SORT CASES BY uid(A) studyday(A).

*Merging sorted files. 
DATASET ACTIVATE DataSet7.
MATCH FILES /FILE=*
  /TABLE='DataSet5'
  /BY uid studyday.
EXECUTE.

*YEAR 3. 

*Sorting original daily data by UID and Day of study.
DATASET ACTIVATE DataSet5.
SORT CASES BY uid(A) studyday(A).

*Sorting additional daily data by UID and Day of study.
DATASET ACTIVATE DataSet6.
SORT CASES BY uid(A) studyday(A).

* Merging sorted files. 
DATASET ACTIVATE DataSet5.
MATCH FILES /FILE=*
  /TABLE='DataSet6'
  /BY uid studyday.
EXECUTE.

*YEAR 4.
 
*Sorting original daily data by UID and day of study. 
DATASET ACTIVATE DataSet10.
SORT CASES BY uid(A) studyday(A).

*Sorting additiona daily data by UID and day of study. 
DATASET ACTIVATE DataSet9.
SORT CASES BY uid(A) studyday(A).

*Merging  sorted data.
DATASET ACTIVATE DataSet10.
MATCH FILES /FILE=*
  /TABLE='DataSet9'
  /BY uid studyday.
EXECUTE.
