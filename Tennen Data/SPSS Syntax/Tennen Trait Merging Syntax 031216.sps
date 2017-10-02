*Merging Demographic Data with Year 1 Data. 

*Sorting original trait year 1 Data. 

DATASET ACTIVATE DataSet2.
SORT CASES BY uid(A) year(A).

*Sorting demographic year 1 data. 

DATASET ACTIVATE DataSet1.
SORT CASES BY uid(A).
*Year is not in the demographic data set as it is all year 1. 

*Merging the sorted files now they're sorted. 


DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet1'
  /BY uid.
EXECUTE.

*Save as new merged file. 

*Run demographics on new merged file. 


FREQUENCIES VARIABLES=w1age w1gender w1year w1whrliv w1race
  /STATISTICS=STDDEV RANGE MEAN MEDIAN
  /ORDER=ANALYSIS.
