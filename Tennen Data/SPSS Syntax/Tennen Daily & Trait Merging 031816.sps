* YEAR ONE - Dataset Merging Trait data (including demographics) with All Daily Data. 

*Sorting Trait Data. 
DATASET ACTIVATE DataSet2.
SORT CASES BY uid(A).

*Sorting Daily Data. 

DATASET ACTIVATE DataSet1.
SORT CASES BY uid(A).

*Matching data based on ID - merging TRAIT with DAILY. 

DATASET ACTIVATE DataSet2.
MATCH FILES /FILE=*
  /TABLE='DataSet1'
  /BY uid.
EXECUTE.
