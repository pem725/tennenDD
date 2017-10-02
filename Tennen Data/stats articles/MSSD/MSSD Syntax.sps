*************Mean Squared Successive Difference (MSSD)*************

*RESTRUCTURING THE DATA

*1.	Data --> Restructure --> Restructure selected cases into variables
*2.	Insert the variable on which cases will be matched into “Identifier Variable(s)” (this is usually the subject ID number)
*3.	Select “Yes – data will be sorted by the Identifier and Index variables”
*4.	Select “Group by original variable” and nothing else
*5.	Click “Finish”

SORT CASES BY ID.
CASESTOVARS
  /ID=ID
  /GROUPBY=VARIABLE.

*COMPUTING THE VARIABLE
*1.	Ensure that all missing values are accounted for:

RECODE DAYKEY.1 to DAYKEY.23 (MISSING=SYSMIS).
RECODE NA.1 to NA.23 (MISSING=SYSMIS).
EXECUTE.

*2.	Run this syntax, replacing “NA” with your variable (and 23 with the highest time value you have, e.g., 14 if max 14 days):

****NA***

compute last=NA.1.
do repeat d=NA.2 to NA.23/ c=c2 to c23.
if not missing(last) and not missing(d) c=(last-d)*(last-d).
if not missing(d) last=d.
end repeat.
execute.

*When computing MSSD for analyses, may need to add constant to make sure all values are positive 
but not substantial enough to change distribution. Here, .0001. 

compute mssd_NA=mean(c2 to c23)+.0001.
execute.

*Time corrected (tc). 

compute first=DAYKEY.1.
do repeat e=DAYKEY.2 to DAYKEY.23/ f=f2 to f23.
if not missing(first) and not missing(e) f=(e-first).
if not missing(e) first=e.
end repeat.
execute.

do repeat c=c2 to c23/f=f2 to f23/natc=natc2 to natc23. 
if not missing(c) and not missing(f) natc=c/f.
end repeat. 
execute. 

compute mssdtc_NA=mean(natc2 to natc23)+.0001.
execute. 

*Time corrected as in Trull et al., 2008.  Here EOD_n = total number of entries the individual provided. 

compute timemed = median(f2 to f23). 
execute. 

do repeat c=c2 to c23/f=f2 to f23/h=h2 to h23. 
if not missing(c) and not missing(f) h=(sqrt(c)/((f/timemed)**(1/EOD_n)))**2.
end repeat. 
execute. 

compute assd_NA=mean(h2 to h23)+.0001.
execute. 

*AAC (acute affect change) > 90th percentile (for na = 1.07). 

do repeat natc=natc2 to natc23/naac=naac2 to naac23. 
if not missing(na) and (na >= 1.07) naac=1.
if not missing(na) and (na < 1.07) naac=0.
end repeat. 
execute. 

Delete variables last to naac23. 
execute. 
