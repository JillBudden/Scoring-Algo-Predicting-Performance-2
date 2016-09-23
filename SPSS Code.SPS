*******************************************************************************
Created by: Jill Budden
Client: GM Apprentice
Test: TMCB 5.2 (TMCB 5.0 + experimental items)
*******************************************************************************
*******************************************************************************

-- 3.4.2007 --

*Merge files.
Hand merged "Merged_Parma, Grand Blanc, Bedford.sav" into "GM Apprentice 2.18.08_birthdate correction MASTER.sav" file because of a lot of inconsistant formats

*Hand created AGE variable:
1) Copy the birthdate column into excel 
2) Type the current date into column right of the birthdate column in excel 
3) Convert the current date into a number 
4) Subtract the birthdate number from the current date number 
5) Divide the difference by 364.25 to get the person’s age 
6) Paste that column back into SPSS.  

*Hand entered some additional criteria data

************************************************************************************
************************************************************************************


variable label race 'Race (as a single categorical variable)'.
value labels race 
1 'Native Indian or Alaskan Native' 
2 'Asian' 
3 'Black or African American'
4 'Hispanic or Latino' 
5 'Native Hawaiian or Other Pacific Islander' 
6 'White' 
7 'Other'.
exe.

value labels educ
 1 'Some high school'
 2 'High school diploma or equivalent'
 3 '2-year technical school or associate degree'
 4 '4-year college degree (e.g., BA or BS)'
 5 'Masters degree'
 6 'Doctorate' .
exe .
variable label educ 'education'.
exe.


value labels gender 1 'Male' 2 'Female'.


*Creating 40 and over variable.
DO IF (age ge 40).
	compute Over40 = 1.
ELSE.
	compute Over40 = 0.
END IF.
Variable Labels Over40 'Age over 40'.
Value labels Over40 0 'Under 40' 1 '40 and Over'.
exe.


*Creating Race Variables.

RECODE
  Race
  (3=1)  (6=0)  (ELSE=SYSMIS)  INTO  cvb .
VARIABLE LABELS cvb 'Caucasian versus African American'.
value labels cvb 0 'Caucasian' 1 'African American'.
EXECUTE .

RECODE
  Race
  (1=1)  (6=0)  (ELSE=SYSMIS)  INTO  cvi .
VARIABLE LABELS cvi 'Caucasian versus American Indian or Alaskan Native'.
value labels cvi 0 'Caucasian' 1 'American Indian or Alaskan Native'.
EXECUTE .

RECODE
  Race
  (5=1)  (6=0)  (ELSE=SYSMIS)  INTO  cvn .
VARIABLE LABELS cvn 'Caucasian versus Native Hawaiian or Other Pacific Islander'.
value labels cvn 0 'Caucasian' 1 'Native Hawaiian or Other Pacific Islander'.
EXECUTE .

RECODE
  Race
  (2=1)  (6=0)  (ELSE=SYSMIS)  INTO  cva .
VARIABLE LABELS cva 'Caucasian versus Asian'.
value labels cva 0 'Caucasian' 1 'Asian'.
EXECUTE .

RECODE
  Race
  (4=1)  (6=0)  (ELSE=SYSMIS)  INTO  cvh .
VARIABLE LABELS cvh 'Caucasian versus Hispanic'.
value labels cvh 0 'Caucasian' 1 'Hispanic'.
EXECUTE .

RECODE
  Race
  (7=1)  (6=0)  (ELSE=SYSMIS)  INTO  cvo .
VARIABLE LABELS cvo 'Caucasian versus Other'.
value labels cvo 0 'Caucasian' 1 'Other'.
EXECUTE .

RECODE
  Race
  (7=1) (5=1) (4=1) (3=1) (2=1) (1=1) (6=0)  (ELSE=SYSMIS)  INTO  cvm .
VARIABLE LABELS cvm 'Caucasian versus Other'.
value labels cvm 0 'Caucasian' 1 'All Minorities'.
EXECUTE .




variable labels
React1		'I can see a clear link between the assessment and what I think is required by the job.'
React2		'I tried my best on the assessment.'
React3		'People who score well on the assessment will be good performers on the job.'
React4		'It would be obvious to anyone that the items on the assessment are related to the job.'
React5		'Doing well on the assessment probably means that a person can do the job well.'
React6		 'I represented my experiences and opinions accurately when answering the questions on the assessment.'
React7		'The assessment will provide an accurate evaluation of a candidates job-related background and experiences.'.
exe .


Value Labels React1 to React7
1 'Strongly Disagree'
2 'Disagree'
3 'Neither Agree nor Disagree'
4 'Agree'
5 'Strongly Agree'.


COMPUTE orgten = (GMTenureYr*12) + (GMTenureMo) .
COMPUTE jobten = (PositionTenureYr*12) + (PositionTenureMo) .

variable labels
	orgten 'Organizational Tenure Total (Measured in Months)'
	jobten 'Position Tenure Total (Measured in Months)'.
exe.

/*E3

Variable labels
YWE1		'In my department, my ideas and opinions are appreciated.'
YWE2 		'People trust each other in my department.'
YWE3 		'My job provides me with chances to grow and develop.'
YWE4		'I rarely think about quitting my job.'
YWE5 		'In my department, people are assigned tasks that allow them to use their best skills.'
YWE6		'My department makes efficient use of its resources, time, and budget.'
YWE7		'I get sufficient feedback about how well I am doing.'
YWE8 		'In my department, people are held accountable for low performance.'
YWE9		'Overall, I have a good understanding of what I am supposed to be doing in my job.'
YWE10		'I feel that I will be a long-term Associate in this company.'
YWE11		'People in my department quickly resolve conflicts when they arise.'
YWE12 	'I am kept well informed about changes in the organization that affect my department.'
YWE13		'In this organization, different departments reach out to help and support each other.'
YWE14		'I cannot think of any reasons why I would quit my current job.'
YWE15		'People in my department understand and respect the things that make me unique.'
YWE16		'In my department, meetings are focused and efficient.'
YWE17		'People in my department cooperate with each other to get the job done.'
YWE18		'I find personal meaning and fulfillment in my work.'
YWE19		'I will probably <B>not</B> look for a new job within the next 6 months.'
YWE20		'I can make meaningful decisions about how I do my job.'
YWE21		'In my department, everyone tries to pick up new skills and knowledge.'
YWE22		'I am satisfied with my job.'
YWE23		'I would recommend employment at my organization to my friends or family.'
YWE24		'I feel a sense of loyalty to this company.'.


***E3 Scoring/Labels.

COMPUTE e3_CABER		= MEAN(YWE1, YWE2, YWE3, YWE5, YWE6, YWE7, YWE8, YWE9, YWE10,YWE11, YWE12, 
					YWE15, YWE16, YWE17, YWE18, YWE20, YWE21) * 17.
COMPUTE e3_outcomes	= MEAN(YWE22, YWE23, YWE24) * 3.
COMPUTE int_stay 		= MEAN(YWE4, YWE10, YWE14, YWE19) * 4.

variable labels 
	e3_CABER 	'Employee Engagement'
	int_stay	 	'Employee Intent to Stay' .
execute .

VARIABLE LABELS
	e3_CABER	'E3 Employee Engagement'
	e3_outcomes	'E3 outcomes'
	int_stay 	'Intent to Stay'.
	EXECUTE.

DESCRIPTIVES
  VARIABLES=e3_CABER int_stay  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .

*To Eliminate Univariate Outliers.
RECODE 	Ze3_CABER Zint_stay  
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE.


*******************************************************BEGIN TMCB 5.0 ITEM-LEVEL SCORING********************************************************.

recode rc1 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb1 .
recode rc2 (1=0) (2=0) (3=0) (4=0) (5=1) (else=sysmis) into cb2 .
recode rc3 (1=0) (2=0) (3=1) (4=0) (5=sysmis) (else=sysmis) into cb3 .
recode rc4 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb4 .
recode rc5 (1=1) (2=0) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb5 .
recode rc6 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb6 .
recode rc7 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb7 .
recode rc8 (1=0) (2=0) (3=0) (4=1) (5=sysmis) (else=sysmis) into cb8 .
recode rc9 (1=1) (2=0) (3=0) (4=0) (5=0) (else=sysmis) into cb9 .
recode rc10 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb10 .
recode rc11 (1=1) (2=0) (3=0) (4=0) (5=0) (else=sysmis) into cb11 .
recode rc12 (1=0) (2=1) (3=0) (4=0) (5=sysmis) (else=sysmis) into cb12 .
recode rc13 (1=4) (2=3) (3=2) (4=1) (5=0) (else=sysmis) into cb13 .
recode rc14 (1=4) (2=3) (3=2) (4=1) (5=0) (else=sysmis) into cb14 .
recode rc15 (1=0) (2=1) (3=2) (4=3) (5=4) (else=sysmis) into cb15 .
recode rc16 (1=2.4) (2=1.4) (3=0.4) (4=0.6) (5=1.6) (else=sysmis) into cb16 .
recode rc17 (1=4) (2=3) (3=2) (4=1) (5=0) (else=sysmis) into cb17 .
recode rc18 (1=2.4) (2=1.4) (3=0.4) (4=0.6) (5=1.6) (else=sysmis) into cb18 .
recode rc19 (1=1) (2=0) (3=1) (4=2) (5=3) (else=sysmis) into cb19 .
recode rc20 (1=3) (2=2) (3=1) (4=0) (5=1) (else=sysmis) into cb20 .
recode rc21 (1=1) (2=0) (3=1) (4=2) (5=3) (else=sysmis) into cb21 .
recode rc22 (1=3) (2=2) (3=1) (4=0) (5=1) (else=sysmis) into cb22 .
recode rc23 (1=0.5) (2=0.5) (3=1.5) (4=2.5) (5=3.5) (else=sysmis) into cb23 .
recode rc24 (1=4) (2=3) (3=2) (4=1) (5=0) (else=sysmis) into cb24 .
recode rc25 (1=4) (2=3) (3=2) (4=1) (5=0) (else=sysmis) into cb25 .
recode rc26 (1=0.5) (2=0.5) (3=1.5) (4=2.5) (5=3.5) (else=sysmis) into cb26 .
recode rc27 (1=2.4) (2=1.4) (3=0.4) (4=0.6) (5=1.6) (else=sysmis) into cb27 .
recode rc28 (1=3) (2=2) (3=1) (4=0) (5=1) (else=sysmis) into cb28 .
recode rc29 (1=1.9) (2=0.9) (3=0.1) (4=1.1) (5=2.1) (else=sysmis) into cb29 .
recode rc30 (1=1) (2=0) (3=1) (4=2) (5=3) (else=sysmis) into cb30 .
recode rc31 (1=0) (2=1) (3=2) (4=3) (5=4) (else=sysmis) into cb31 .
recode rc32 (1=1.6) (2=0.6) (3=0.4) (4=1.4) (5=2.4) (else=sysmis) into cb32 .
recode rc33 (1=2.3) (2=1.3) (3=0.3) (4=0.7) (5=1.7) (else=sysmis) into cb33 .
recode rc34 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb34 .
recode rc35 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb35 .
recode rc36 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb36 .
recode rc37 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb37 .
recode rc38 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb38 .
recode rc39 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb39 .
recode rc40 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb40 .
recode rc41 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb41 .
recode rc42 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb42 .
recode rc43 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb43 .
recode rc44 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb44 .
recode rc45 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb45 .
recode rc46 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb46 .
recode rc47 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb47 .
recode rc48 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb48 .
recode rc49 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb49 .
recode rc50 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb50 .
recode rc51 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb51 .
recode rc52 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb52 .
recode rc53 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb53 .
recode rc54 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb54 .
recode rc55 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb55 .
recode rc56 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb56 .
recode rc57 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb57 .
recode rc58 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb58 .
recode rc59 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb59 .
recode rc60 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb60 .
recode rc61 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb61 .
recode rc62 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb62 .
recode rc63 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb63 .
recode rc64 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb64 .
recode rc65 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb65 .
recode rc66 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb66 .
recode rc67 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb67 .
recode rc68 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb68 .
recode rc69 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb69 .
recode rc70 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb70 .
recode rc71 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb71 .
recode rc72 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb72 .
recode rc73 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb73 .
recode rc74 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb74 .
recode rc75 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb75 .
recode rc76 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb76 .
recode rc77 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb77 .
recode rc78 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb78 .
recode rc79 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb79 .
recode rc80 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb80 .
recode rc81 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb81 .
recode rc82 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb82 .
recode rc83 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb83 .
recode rc84 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb84 .
recode rc85 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb85 .
recode rc86 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb86 .
recode rc87 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb87 .
recode rc88 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb88 .
recode rc89 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb89 .
recode rc90 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb90 .
recode rc91 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb91 .
recode rc92 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb92 .
recode rc93 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb93 .
recode rc94 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb94 .
recode rc95 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb95 .
recode rc96 (1=3) (2=2) (3=1) (4=4) (5=5) (else=sysmis) into cb96 .
recode rc97 (1=1) (2=5) (3=1) (4=1) (5=sysmis) (else=sysmis) into cb97 .
recode rc98 (1=1) (2=5) (3=1) (4=1) (5=sysmis) (else=sysmis) into cb98 .
recode rc99 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb99 .
recode rc100 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into cb100 .
recode rc101 (1=2) (2=4) (3=1) (4=5) (5=sysmis) (else=sysmis) into cb101 .
recode rc102 (1=1) (2=2) (3=4) (4=5) (5=sysmis) (else=sysmis) into cb102 .
recode rc103 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into cb103 .
recode rc104 (1=5) (2=4) (3=1) (4=2) (5=sysmis) (else=sysmis) into cb104 .
recode rc105 (1=1) (2=3) (3=4) (4=5) (5=2) (else=sysmis) into cb105 .
recode rc106 (1=4) (2=2) (3=5) (4=3) (5=sysmis) (else=sysmis) into cb106 .
recode rc107 (1=5) (2=3) (3=2) (4=1) (5=sysmis) (else=sysmis) into cb107 .
execute .



**********************************************************************************************************************************************************************************************************************************


****Scale Scoring - Not Standardized.

****Many Scale Standardization values based on the following applicant data****.

********5.0 Scale Scoring

count sit_mss = cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8,cb9, cb10, cb11, cb12 (sysmis) .
DO IF (sit_mss GE 0).
compute sji_sit = (sum(sum(cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8,cb9, cb10, cb11, cb12),(sit_mss * 1)) * 1) .
ELSE.
compute sji_sit = mean(cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8,cb9, cb10, cb11, cb12) * 1 * 12 .
END IF.

count absf_mss = cb13, cb14, cb15, cb16, cb17, cb18, cb19 (sysmis) .
DO IF (absf_mss GE 2).
compute ab_sf = (sum(sum(cb13, cb14, cb15, cb16, cb17, cb18, cb19),(absf_mss * 4)) * -1) .
ELSE.
compute ab_sf = mean(cb13, cb14, cb15, cb16, cb17, cb18, cb19) * -1 * 7 .
END IF.

count abqa_mss = cb20, cb21, cb22, cb23, cb24, cb25, cb26 (sysmis) .
DO IF (abqa_mss GE 2).
compute ab_qa = (sum(sum(cb20, cb21, cb22, cb23, cb24, cb25, cb26),(abqa_mss * 4)) * -1) .
ELSE.
compute ab_qa = mean(cb20, cb21, cb22, cb23, cb24, cb25, cb26) * -1 * 7 .
END IF.

count ab_coll_mss = cb27, cb28, cb29, cb30, cb31, cb32, cb33 (sysmis) .
DO IF (ab_coll_mss GE 2).
compute ab_coll = (sum(sum(cb27, cb28, cb29, cb30, cb31, cb32, cb33),(ab_coll_mss * 4)) * -1) .
ELSE.
compute ab_coll = mean(cb27, cb28, cb29, cb30, cb31, cb32, cb33) * -1 * 7 .
END IF.

count dad_mss = cb37, cb44, cb49, cb52, cb62, cb66, cb73, cb81,cb86, cb90 (sysmis) .
DO IF (dad_mss GE 3).
compute dsp_ad = (sum(sum(cb37, cb44, cb49, cb52, cb62, cb66, cb73, cb81,cb86, cb90),(dad_mss * 1)) * 1) .
ELSE.
compute dsp_ad = mean(cb37, cb44, cb49, cb52, cb62, cb66, cb73, cb81,cb86, cb90) * 1 * 10 .
END IF.

count djfs_mss = cb34, cb38, cb40, cb50, cb53, cb56, cb59, cb63,cb67, cb70, cb74, cb82, cb91 (sysmis) .
DO IF (djfs_mss GE 4).
compute dsp_jfs = (sum(sum(cb34, cb38, cb40, cb50, cb53, cb56, cb59, cb63,cb67, cb70, cb74, cb82, cb91),(djfs_mss * 1)) * 1) .
ELSE.
compute dsp_jfs = mean(cb34, cb38, cb40, cb50, cb53, cb56, cb59, cb63,cb67, cb70, cb74, cb82, cb91) * 1 * 13 .
END IF.

count dlc_mss = cb41, cb45, cb54, cb64, cb71, cb75, cb78, cb83, cb87, cb92 (sysmis) .
DO IF (dlc_mss GE 3).
compute dsp_lc = (sum(sum(cb41, cb45, cb54, cb64, cb71, cb75, cb78, cb83, cb87, cb92),(dlc_mss * 1)) * 1) .
ELSE.
compute dsp_lc = mean(cb41, cb45, cb54, cb64, cb71, cb75, cb78, cb83, cb87, cb92) * 1 * 10 .
END IF.

count dse_mss = cb35, cb39, cb42, cb46, cb57, cb60, cb68, cb76,cb79, cb88 (sysmis) .
DO IF (dse_mss GE 3).
compute dsp_se = (sum(sum(cb35, cb39, cb42, cb46, cb57, cb60, cb68, cb76,cb79, cb88),(dse_mss * 1)) * 1) .
ELSE.
compute dsp_se = mean(cb35, cb39, cb42, cb46, cb57, cb60, cb68, cb76,cb79, cb88) * 1 * 10 .
END IF.

count ddm_mss = cb47, cb51, cb55, cb58, cb69, cb77, cb84, cb93 (sysmis) .
DO IF (ddm_mss GE 3).
compute dsp_dm = (sum(sum(cb47, cb51, cb55, cb58, cb69, cb77, cb84, cb93),(ddm_mss * 1)) * 1) .
ELSE.
compute dsp_dm = mean(cb47, cb51, cb55, cb58, cb69, cb77, cb84, cb93) * 1 * 8 .
END IF.

count dwq_mss = cb36, cb43, cb48, cb61, cb65, cb72, cb80, cb85,cb89 (sysmis) .
DO IF (dwq_mss GE 3).
compute dsp_wq = (sum(sum(cb36, cb43, cb48, cb61, cb65, cb72, cb80, cb85,cb89),(dwq_mss * 1)) * 1) .
ELSE.
compute dsp_wq = mean(cb36, cb43, cb48, cb61, cb65, cb72, cb80, cb85,cb89) * 1 * 9 .
END IF.

count adpt_mss = cb94, cb96, cb99, cb101, cb103, cb105, cb107 (sysmis) .
DO IF (adpt_mss GE 2).
compute be_adpt = (sum(sum(cb94, cb96, cb99, cb101, cb103, cb105, cb107),(adpt_mss * 1)) * 1) .
ELSE.
compute be_adpt = mean(cb94, cb96, cb99, cb101, cb103, cb105, cb107) * 1 * 7 .
END IF.

count ws_mss = cb95, cb97, cb98, cb100, cb102, cb104, cb106 (sysmis) .
DO IF (ws_mss GE 2).
compute be_ws = (sum(sum(cb95, cb97, cb98, cb100, cb102, cb104, cb106),(ws_mss * 1)) * 1) .
ELSE.
compute be_ws = mean(cb95, cb97, cb98, cb100, cb102, cb104, cb106) * 1 * 7 .
END IF.
execute .


VARIABLE LABELS
sji_sit 'WRJ Situational Judgment' 
ab_sf 'WRJ AB Safety Awareness'
ab_qa 'WRJ AB Quality Orientation'
ab_coll 'WRJ AB Collaboration'
dsp_ad 'WSD Adaptability'
dsp_jfs 'WSD Job Fit Team Member'
dsp_lc 'WSD Locus of Control'
dsp_se 'WSD Self Efficacy'
dsp_dm 'WSD Decision Making Style' 
dsp_wq 'WSD Work Quality'
be_adpt 'BE Adaptability'
be_ws 'BE Work Standards'.
EXECUTE.

*Counting Items Missing for a Filter - Should be the Full Set of Items.  Do occular inspection of scale_mss variables*

COUNT items_missing 	= rc1 to rc107 (0).			
EXECUTE. 


*deleting Items missing variables
delete variables 	 sit_mss absf_mss abqa_mss ab_coll_mss dad_mss djfs_mss dlc_mss dse_mss ddm_mss dwq_mss adpt_mss ws_mss.


***Recoding Predictor Outliers as SYSMIS.

*Cleaning Up Standardized Variables - This is Important to Keep You From Creating New Standardized Variables Rather than Replacing the Old.
*NOTE: The First Time, You Will Get an Error (b/c the Standardized Variables Have Not Yet Been Created).

DELETE VARIABLES 	Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws.


*Run This to Base the Standardized Variables on Cases Remaining After the _Predictor_ Filters.

USE ALL.
COMPUTE filter_$=(pred_filters = 0).
FILTER BY filter_$.
EXECUTE .


TITLE 'GM Apprentice TMCB Validation Analyses'.
SUBTITLE 'Predictor Scale Descriptives'.
DESCRIPTIVES VARIABLES=	sji_sit ab_sf ab_qa ab_coll dsp_ad dsp_jfs dsp_lc dsp_se dsp_dm dsp_wq be_adpt be_ws
   /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .


/*This Counts The Outliers For Use in a Filter.
RECODE 	Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws
                        (Lowest thru -3.29 = 1) (3.29 thru Highest = 1) (ELSE = 0)
	            INTO
	            out01 to out12.
COMPUTE count_outliers = sum(out01 to out12).
EXECUTE.


**Deleting outlier variables 
DELETE VARIABLES out01 to out12 .


*Recoding to Eliminate Univariate Outliers on All Predictor Scales.
RECODE  	Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .



/*Composite scores.

Numeric wrj_cmp dsp_cmp be_cmp E3ready (f8.2) .

COMPUTE wrj_cmp	= mean(Zsji_sit, Zab_sf, Zab_qa, Zab_coll).
COMPUTE dsp_cmp	= mean(Zdsp_ad, Zdsp_jfs, Zdsp_lc, Zdsp_se, Zdsp_dm, Zdsp_wq).
COMPUTE be_cmp	= mean(Zbe_adpt, Zbe_ws).
COMPUTE E3ready	= mean(Zdsp_ad, Zdsp_se).
EXECUTE.

VARIABLE LABELS
	wrj_cmp		'Work-related Judgment Composite'
	dsp_cmp		'Work Style and Disposition Composite'
	be_cmp			'Background Experience Composite'
	E3ready 		'Engagement Readiness'	.
EXECUTE.
	

DELETE VARIBLES Zwrj_cmp Zdsp_cmp Zbe_cmp ZE3ready.

*Standardizing Based on Cases Remaining After the _Predictor_ Filters.
USE ALL.
COMPUTE filter_$=(pred_filters = 0).
FILTER BY filter_$.
EXECUTE .

TITLE 'GM Apprentice TMCB 5.0 Validation Study - Predictor Composite Descriptives'.
DESCRIPTIVES
  VARIABLES= wrj_cmp dsp_cmp be_cmp E3ready 
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		


*IMPORTANT - To Eliminate Univariate Outliers on All Predictor Composites.
RECODE  	Zwrj_cmp Zdsp_cmp Zbe_cmp ZE3ready
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .
	

COMPUTE cb_ovr	= mean(Zwrj_cmp, Zdsp_cmp, Zbe_cmp).
exe.

VARIABLE LABELS
	cb_ovr			'TMCB 5.0 Overall'.
EXECUTE.

*Cleaning Up Standardized Variables.
DELETE VARIABLES Zcb_ovr .

*Standardizing Based on Cases Remaining After the _Predictor_ Filters.
USE ALL.
COMPUTE filter_$=(pred_filters = 0).
FILTER BY filter_$.
EXECUTE .

TITLE 'GM Apprentice TMCB 5.0 Validation Study - Overall Test Score Descriptives'.
DESCRIPTIVES
  VARIABLES=cb_ovr
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .

*IMPORTANT - To Eliminate Univariate Outliers on the Overall Predictor Score.
RECODE  	Zcb_ovr
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .


FILTER OFF.
USE ALL.
EXECUTE .


****************************************************************BEGIN CRITERION CREATION**************************************************************

numeric al_avg collab_avg comm_avg cl_avg qo_avg sa_avg ts_avg ws_avg (F8.2).

COMPUTE al_avg 		= mean (AppliedLearning1, AppliedLearning2, AppliedLearning3, AppliedLearning_Overall).
COMPUTE collab_avg 		= mean (Collaboration1, Collaboration2, Collaboration3, Collaboration_Overall).
COMPUTE comm_avg 		= mean (Comm1, Comm2, Comm3, Comm_Overall).
COMPUTE cl_avg 		= mean (ContinuousLearning1, ContinuousLearning2, ContinuousLearning3, ContinuousLearning_Overall).
COMPUTE qo_avg 		= mean (QualityOrientation1, QualityOrientation2, QualityOrientation3, QualityOrientation_Overall).
COMPUTE sa_avg 		= mean (SafetyAwareness1, SafetyAwareness2, SafetyAwareness3, SafetyAwareness_Overall).
COMPUTE tk_avg 		= mean (TechnicalKnowledge1, TechnicalKnowledge2, TechnicalKnowledge3, TechnicalKnowledge_Overall).
COMPUTE ts_avg 		= mean (TechnicalSkill1, TechnicalSkill2, TechnicalSkill3, TechnicalSkill_Overall).
COMPUTE ws_avg 		= mean (WorkStandards1, WorkStandards2, WorkStandards3, WorkStandards_Overall).
EXECUTE.

VARIABLE LABELS
	al_avg 		'Applied Learning'
	collab_avg 	'Collaboration'
	comm_avg	'Communication'
	cl_avg 		'Continuous Learning'
	qo_avg 		'Quality Orientation'
	sa_avg 		'Safety Awareness'
	tk_avg 		'Technical Knowledge'
	ts_avg 		'Technical Skill'
	ws_avg 		'Work Standards'.
EXECUTE .
 


VARIABLE LABELS
	Attendance			'Bottom-line: Attendance'
	SpeedtoPerformance		'Bottom-line: Speed to Performance'
	AvoidMisuseofTime		'Bottom-line: AvoidMisuseofTime'
	AdvancethroughProgram		'Bottom-line: AdvancethroughProgram'	
	TroubleshootEquipment		'Bottom-line: TroubleshootEquipment'
	EnterReceiveonComputer	'Bottom-line: EnterRecieveonComputer'.
EXECUTE .



DELETE VARIABLES 	Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
			ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer.

USE ALL.
COMPUTE filter_$=(crit_filters= 0).
FILTER BY filter_$.
EXECUTE .

SUBTITLE 'Criterion Competency Descriptives'.
DESCRIPTIVES
  VARIABLES= al_avg collab_avg comm_avg cl_avg qo_avg sa_avg ts_avg ws_avg tk_avg 
                       Attendance SpeedtoPerformance AvoidMisuseofTime AdvancethroughProgram TroubleshootEquipment EnterReceiveonComputer
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .
EXECUTE.

*To Eliminate Univariate Outliers 
RECODE
	Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE.


numeric ovr_unit cando willdo interp bottomline (F8.2).

COMPUTE ovr_unit  	= mean (Zal_avg, Ztk_avg, Zts_avg, Zcl_avg, Zqo_avg, Zsa_avg, Zws_avg, Zcollab_avg, Zcomm_avg).
COMPUTE cando 	= mean (Zal_avg, Ztk_avg, Zts_avg).
COMPUTE willdo 	= mean (Zcl_avg, Zqo_avg, Zsa_avg, Zws_avg).
COMPUTE interp 	= mean (Zcollab_avg, Zcomm_avg).
COMPUTE bottomline	= mean (ZAttendance, ZSpeedtoPerformance, ZAvoidMisuseofTime, ZAdvancethroughProgram, ZTroubleshootEquipment, ZEnterReceiveonComputer).
EXECUTE.

VARIABLE LABELS
	ovr_unit 	'Overall Performance (Unweighted Average Across Dimension Ratings)'
	cando 		'Can Do Performance Composite'
	willdo 		'Will Do Performance Composite'
	interp 		'Interpersonal Performance Composite'
	bottomline	'Bottomline Performance Composite'.
EXECUTE.


DELETE VARIABLES 	Zovr_unit Zcando Zwilldo Zinterp Zbottomline.



SUBTITLE 'Criterion Competency Descriptives'.
DESCRIPTIVES
  VARIABLES= 	ovr_unit cando willdo interp bottomline
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .
EXECUTE.


*To Eliminate Univariate Outliers.
RECODE 	Zovr_unit Zcando Zwilldo Zinterp Zbottomline
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE.

FILTER OFF.
USE ALL.
EXECUTE .


****************************************************************BEGIN FILTER CREATION**************************************************************.

***************Potential RATER ERROR criterion filters (using Evan's syntax)**************************

*****STEP 1******

***First, create a single variable averaging all of the individual dimensions, but WITHOUT overall performance ratings
***Second, create a variable as the variance of all dimension items (NOT including overall items)
***Insert these variable names in the right side of the computations below
***Also, insert the name of your Familiarity Variable and your Frequency of Contact Variable (if available)

COMPUTE alldims 		= mean (Zal_avg, Zcollab_avg, Zcomm_avg, Zcl_avg, Zqo_avg, Zsa_avg, Zts_avg, Zws_avg, Ztk_avg) .
COMPUTE pers_var 		= variance (AppliedLearning1, AppliedLearning2, AppliedLearning3, Collaboration1, Collaboration2, Collaboration3, Comm1,
                                                                Comm2, Comm3, ContinuousLearning1, ContinuousLearning2, ContinuousLearning3, QualityOrientation1,
                                                                QualityOrientation2, QualityOrientation3, SafetyAwareness1, SafetyAwareness2, SafetyAwareness3,
                                                                TechnicalKnowledge1, TechnicalKnowledge2, TechnicalKnowledge3, TechnicalSkill1, TechnicalSkill2, TechnicalSkill3, 
                                                                WorkStandards1, WorkStandards2, WorkStandards3) .
COMPUTE famil			= Frequency .
COMPUTE contact 		= Familiarity .
COMPUTE rater_accuracy	= Accuracy .
EXECUTE.

****STEP 2: RUN THE SYNTAX BELOW****
**************NOTE: IT WILL REPLACE THE WORKING FILE, SO SAVE BEFORE RUNNING THIS SECTION***************

*****Aggregating by Supervisor to Check Rater Quality--Start by Recoding Supervisor Name into a Numeric Code Variable
*****NOTE: This syntax deletes cases with blank supervisor names
*****To Aggregate by Rating Site, Replace "sup_id" with Location Code.by Rating Site, Replace "supid" with Location Code

AUTORECODE
  VARIABLES=SupervisorLastName/INTO sup_id
  /PRINT.


AGGREGATE OUTFILE=*
	/BREAK 								= sup_id 
	/COUNT 	'Number of Incumbents Rated'				= N 
	/avgfamil 	'Average Familiarity'					= mean(famil)
	/avgcont 	'Average Contact Frequency'				= mean(contact)
	/avgacc		'Average Accuracy'					= mean(rater_accuracy)
	/avgall 		'Mean Across Dims and Ratees'				= mean(alldims)
	/sdratee		'B/w Ratee Discriminability - SD Across Dims'		= sd(alldims)
	/varall		'Halo - Low Variance Within Ratee'			= mean(pers_var)
	/highall 		'Leniency - Pct of Ratees Above 4'			= pin(alldims,4.01,5)
	/lowall		'Severity - Pct of Ratees Below 2'			            = pin(alldims,1,1.99)
	/midall 		'Central Tendency - Pct of Ratees b/w 2.5 and 3.5'	= pin(alldims,2.5,3.5).
EXECUTE.

FILTER OFF.
USE ALL.
SELECT IF(sup_id > 1).
EXECUTE.


***Saves Standardized Values as Variables

DESCRIPTIVES
  VARIABLES=count avgfamil avgacc avgcont avgall sdratee varall highall lowall midall
   /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .

***Sets Leniency, Severity, and Central Tendency Values as Missing for Those Rating Only 1 Person
***Otherwise, these concepts really make no sense...

DO IF (count = 1) .
RECODE
  highall lowall midall  (ELSE=SYSMIS)  .
END IF .
EXECUTE .

***Number of Incumbents Report.

SORT CASES BY
  count (D) .
summarize
  /tables=sup_id count zcount 
  /title='Supervisors by Number of Incumbents Rated'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Average Familiarity Report.

SORT CASES BY
  avgfamil (A) .
summarize
  /tables=sup_id count avgfamil zavgfamil 
  /title='Supervisors by Average Familiarity Rating'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Average Accuracy Report.

SORT CASES BY
  avgacc (A) .
summarize
  /tables=sup_id count avgacc zavgacc
  /title='Supervisors by Average Accuracy Rating'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Average Contact Frequency Report--NOTE: CHECK CODING TO MAKE SURE THE ORDERING IS APPROPRIATE.

SORT CASES BY
  avgcont (A) .
summarize
  /tables=sup_id count avgcont zavgcont 
  /title='Supervisors by Average Contact Frequency Rating'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***SD Across Ratees Report.

SORT CASES BY
  sdratee   (A) .
summarize
  /tables=sup_id count sdratee zsdratee 
  /title='Supervisors by SD Across Ratees'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Within Ratee Variance Report.

SORT CASES BY
  varall (A) .
summarize
  /tables=sup_id count varall zvarall 
  /title='Supervisors by Within Ratee Variance'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Potenial Leniency Report.

SORT CASES BY
  highall  (D) .
summarize
  /tables=sup_id count highall zhighall
  /title='Supervisors by Percent Above 4 - Potential Leniency'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Potenial Severity Report.

SORT CASES BY
  lowall  (D) .
summarize
  /tables=sup_id count lowall zlowall
  /title='Supervisors by Percent Below 2 - Potential Severity'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.

***Potenial Central Tendency Report.

SORT CASES BY
  midall  (D) .
summarize
  /tables=sup_id count midall zmidall
  /title='Supervisors by Percent b/w 2.5 and 3.5 - Potential Central Tendency'
  /format=validlist nocasenum total missing='.'
  /statistics=none.
execute.


******STEP 3: look for potential outliers (Z score above or below 3.29)

*************************
CRITERION FILTERS -- ('1' is filtered OUT of sample)
*************************


 FREQUENCIES
  VARIABLES=frequency familiarity accuracy
  /ORDER=  ANALYSIS .



RECODE Frequency		(1 = 1) (ELSE = 0) 	INTO low_freq_filter.
RECODE Familiarity		(1 = 1) (ELSE = 0) 	INTO low_famil_filter.
RECODE Accuracy		(1 = 1) (ELSE = 0) 	INTO low_accuracy_filter.
RECODE SupervisorLastName	('Kelly/Mentzer/Mingo' = 1) (ELSE = 0)	INTO Halo_error_filter.	
EXECUTE.

variable labels
	low_freq_filter			'Filtered if low Frequency'	
	low_famil_filter			'Filtered if low Familiarity'
	low_accuracy_filter		'Filtered if low Accuracy'
	halo_error_filter			'Filtered if manager Halo Z score was > 3.29'.
exe.

/*NOTE: low_freq_filter is not included in the final crit_filters (frequency of contact with the apprentices is probably not a good filter for this sample***

COMPUTE crit_filters = sum(low_accuracy_filter, low_famil_filter, halo_error_filter) .
RECODE crit_filters (0=0) (ELSE = 1) .
EXECUTE .


*************************
PREDICTOR FILTERS -- ('1' is filtered OUT of sample)
*************************

FREQUENCIES
  VARIABLES=items_missing count_outliers react2 react6 orgten jobten 
  /ORDER=  ANALYSIS .


RECODE items_missing  	(17 thru highest= 1)  (ELSE=0) 		INTO items_missing_filter .
*RECODE count_outliers 	(2 thru Highest = 1) (ELSE = 0)		INTO outliers_filter.
*RECODE orgten 		(Lowest thru 2 = 1) (ELSE = 0)		INTO orgten_filter.
RECODE jobten			(Lowest thru 2 = 1) (ELSE = 0)		INTO posten_filter.
RECODE React2 		(1 = 1) (ELSE=0)  			INTO triedbest_filter .
RECODE React6 		(1 = 1) (ELSE=0)  			INTO honesty_filter .


variable labels
	triedbest_filter			'Filtered if Strongly Disagreed with Tried Best'
	honesty_filter			'Filtered if Strongly Disagreed with Honesty'.
exe.



COMPUTE pred_filters = sum(items_missing_filter, posten_filter, triedbest_filter, honesty_filter).
RECODE pred_filters (0 = 0) (ELSE = 1). 
EXECUTE .


*************************
FINAL SAMPLE FILTER -- ('0' is filtered OUT of sample)
*************************

/*manually entered a matched_filter variable (0 = Matched, 1 = not matched)... Number of matched cases = 150... "Matched" = have both supervisor rated performance and TMCB data

delete variables val_samp val_samp_temp .

COMPUTE val_samp_temp = sum(pred_filters, crit_filters, matched_filter).
RECODE val_samp_temp (0 = 1) (ELSE = 0).
EXECUTE.

RENAME VARIABLES (val_samp_temp = val_samp).
EXECUTE.

variable labels
val_samp 'FINAL VALIDATION SAMPLE'.
exe.

value labels val_samp
0 'Filtered OUT of sample'
1 'Included in sample'.
exe.


***************************************************PRELIMINARY CORRELATIONS*************************************************************************.

TITLE 'frequency tables of various filter variables'.
FREQUENCIES
  VARIABLES=low_famil_filter low_freq_filter halo_error_filter low_accuracy_filter crit_filters items_missing_filter posten_filter pred_filters
                      matched_filter triedbest_filter honesty_filter val_samp
  /STATISTICS=SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=  ANALYSIS .


TITLE 'frequency tables of various filter variables'.
FREQUENCIES
  VARIABLES=low_famil_filter low_freq_filter low_accuracy_filter 
  /STATISTICS=SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=  ANALYSIS .

TITLE 'histograpms of the predictor score distribution'.
FREQUENCIES
  VARIABLES=Zcb_ovr Zwrj_cmp Zdsp_cmp Zbe_cmp 
                      Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws
  /HISTOGRAM
  /ORDER=  ANALYSIS .


TITLE 'histograpms of the criterion score distribution'.
FREQUENCIES
  VARIABLES=Zovr_unit Zcando Zwilldo Zinterp Zbottomline
                      Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	          ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                      Ze3_CABER Zint_stay 
 /HISTOGRAM
  /ORDER=  ANALYSIS .


USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= Zcb_ovr Zwrj_cmp Zdsp_cmp Zbe_cmp 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


*prelim outcomes for other tests & CumulativeGPA
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= Zcb_ovr Zwrj_cmp Zdsp_cmp Zbe_cmp 
		READING ARITHMETIC READPRDR MECHAPT TSPS EAS5Score 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline CumulativeGPA
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .

USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= Zcb_ovr Zwrj_cmp Zdsp_cmp Zbe_cmp 
                        WITH 
                        READING ARITHMETIC READPRDR MECHAPT TSPS EAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



/*After first pass go back to the beginning, recreate the standardized variables, then come back to this section.


*************************************************************************************************COMPOSITE MANIPULATIONS for final scoring********************************************************************.
***Factor level manipulations***.

/*look for negative Beta coefficients -- these scales may need to be removed.


TITLE 'GM Apprentice TMCB WRJ regression'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zovr_unit  
  /METHOD=ENTER Zsji_sit, Zab_sf, Zab_qa, Zab_coll.
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice TMCB WSD regression'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zovr_unit  
  /METHOD=ENTER Zdsp_ad, Zdsp_jfs, Zdsp_lc, Zdsp_se, Zdsp_dm, Zdsp_wq.
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice TMCB BE regression'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT  Zovr_unit
  /METHOD=ENTER Zbe_adpt, Zbe_ws.
FILTER OFF.
USE ALL.
EXECUTE .



************************************************CREATE NEW COMPOSITES**********************************************************.



COMPUTE wrj_cmp2	 	= mean(Zsji_sit, Zab_coll).       	        /*no Zab_sf or Zab_qa  .

COMPUTE dsp_cmp2	 	= mean(Zdsp_ad, Zdsp_lc, Zdsp_se, Zdsp_wq). 	        /*no Zdsp_jfs or Zdsp_dm.

COMPUTE be_cmp2	 	= mean(Zbe_adpt, Zbe_ws). 

/* NOTE: for wrj_cmp2 Zab_sf had negative B weight... Zab_qa did not (B= .001), however, in the first round of analyses Zab_qa had a negative beta weight... So I'm removing both.

VARIABLE LABELS
	wrj_cmp2		'WRJ composite -- NO Zab_sf or Zab_qa'
	dsp_cmp2		'WSD composite -- NO Zdsp_jfs or Zdsp_dm'
	be_cmp2	 	'BE composite -- no scales removed'.
EXECUTE.


delete variables Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2.

USE ALL.
COMPUTE filter_$=(pred_filters = 0).
FILTER BY filter_$.
EXECUTE .
DESCRIPTIVES
  VARIABLES=wrj_cmp2 dsp_cmp2 be_cmp2 
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
TITLE 'preliminary correlations between all adjusted compostites and criteria'.
CORRELATIONS
  /VARIABLES= Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
TITLE 'preliminary between all original compostites and criteria'.
CORRELATIONS
  /VARIABLES= Zwrj_cmp Zdsp_cmp Zbe_cmp 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



***********************************************************************************Overall Factor Weighting*********************************************************************


TITLE 'GM Apprentice TMCB Validation Study'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zovr_unit
  /METHOD=ENTER Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 .
EXECUTE .



compute TMCB_ovr2 = mean(1*Zwrj_cmp2, 3*Zdsp_cmp2, 1*Zbe_cmp2) .
compute TMCB_ovr3 = mean(1*Zwrj_cmp2, 2*Zdsp_cmp2, 1*Zbe_cmp2) .
compute TMCB_ovr4 = mean(2*Zwrj_cmp2, 3*Zdsp_cmp2, 1*Zbe_cmp2) .
compute TMCB_ovr5 = mean(2*Zwrj_cmp2, 2*Zdsp_cmp2, 1*Zbe_cmp2) .
compute TMCB_ovr6 = mean(1*Zwrj_cmp2, 3*Zdsp_cmp2, 0*Zbe_cmp2) .
EXECUTE.



USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
SUBTITLE 'Overall Test Score Descriptives'. 
DESCRIPTIVES VARIABLES =TMCB_ovr2 TMCB_ovr3 TMCB_ovr4 TMCB_ovr5 TMCB_ovr6
/SAVE 
/STATISTICS=MEAN STDDEV MIN MAX .
FILTER OFF.
USE ALL.
EXECUTE .


*****************************************************************Preliminary Correlations (with adjusted composites) & Overall Scatterplot********************************************************


TITLE 'preliminary correlations between potential test score composites and criteria'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 ZTMCB_ovr3 ZTMCB_ovr4 ZTMCB_ovr5 ZTMCB_ovr6
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .


TITLE 'scatterplots of overall test score with overall performance'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
GRAPH
  /SCATTERPLOT(BIVAR)=ZTMCB_ovr2 WITH Zovr_unit 
  /MISSING=LISTWISE .


*********************TMCB_ovr2 is the winner!!!!

variable labels
TMCB_ovr2 'TMCB - 1,3,1 -- FINAL TMCB' 
ZTMCB_ovr2 'Z score: TMCB - 1,3,1 -- FINAL TMCB' .
exe.

DELETE VARIABLES TMCB_ovr3 TMCB_ovr4 TMCB_ovr5 .


DELETE VARIABLES ZTMCB_ovr3 ZTMCB_ovr4 ZTMCB_ovr5 .


**********************************************************FULL CORRELATION TABLE*******************************************************************

TITLE 'FINAL correlations between all scales and criteria'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



***Correlations for Test X Dimension Spreadsheet.

TITLE 'Correlations for Test X Dimension Spreadsheet_1'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES=	Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
		WITH
		ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'Correlations for Test X Dimension Spreadsheet_2'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES=	Ze3_CABER Zint_stay 
                     	WITH
		ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


*******************************************************************EXPECTANCY CHARTS/ODDS RATIOS********************************************************.

DELETE VARIABLES 	 NZTMCB_o NZovr_un NZcando NZwilldo NZinterp NZbottom NZal_avg NZcollab NZcomm_a NZcl_avg NZqo_avg NZsa_avg NZts_avg NZws_avg
                                     NZtk_avg NZAttend NZSpeedt NZAvoidM NZAdvanc NZTroubl NZEnterR NZe3_CAB NZint_st.
EXECUTE.


USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
RANK VARIABLES=	ZTMCB_ovr2 
			(A) /NTILES (4) /PRINT=NO /TIES=MEAN .

USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
RANK VARIABLES=	Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                                    Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	                        ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
	 		Ze3_CABER Zint_stay 
                                    (A) /NTILES (2) /PRINT=NO /TIES=MEAN .

RECODE NZTMCB_o (1 = 1) (2 thru 3 = 2) (4 = 3) INTO NZcb_ovr_3Cats.
EXECUTE. 


TITLE 'GM Apprentice TMCB - Crosstabs'.
CROSSTABS
/TABLES=
NZcb_ovr_3Cats
BY  
NZovr_un NZcando NZwilldo NZinterp NZbottom NZal_avg NZcollab NZcomm_a NZcl_avg NZqo_avg NZsa_avg NZts_avg NZws_avg
NZtk_avg NZAttend NZSpeedt NZAvoidM NZAdvanc NZTroubl NZEnterR NZe3_CAB NZint_st
/FORMAT= AVALUE TABLES
/CELLS= COUNT ROW .   


FILTER OFF.
USE ALL.
EXECUTE .


********************************************Additional Information PPT presentation************************************************************.

TITLE 'GM Apprentice TMCB Validation Study -- demographics'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
FREQUENCIES
  VARIABLES=gender race Over40 age
  /STATISTICS=STDDEV MEAN
  /ORDER=  ANALYSIS .
DESCRIPTIVES
  VARIABLES=age
  /STATISTICS=MEAN STDDEV MIN MAX .
FILTER OFF.
USE ALL.
EXECUTE .

DESCRIPTIVES
  VARIABLES=age
  /STATISTICS=MEAN STDDEV MIN MAX .



TITLE 'GM Apprentice TMCB Validation Study -- outcome variables'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 
  WITH 
  Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .

TITLE 'GM Apprentice TMCB Validation Study -- outcome variables'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 
  WITH 
 Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice TMCB Validation Study -- bottomline variables'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES=ZTMCB_ovr2 
  WITH 
  ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice TMCB Validation Study -- engagement variables'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 
  WITH 
  Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .




************************************************************************************************************************************************************************************************************************************
*****************************************************************************START RAMSAY, EAS-5, GPA ANALYSES***************************************************************************************************
************************************************************************************************************************************************************************************************************************************
************************************************************************************************************************************************************************************************************************************

TITLE 'Prelim correlations'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        READING ARITHMETIC READPRDR MECHAPT TSPS EAS5Score
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline CumulativeGPA 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



*****************************************************BEGIN RAMSAY & EAS-5 CREATION**************************************************************


COUNT items_missing_RAMSAY 	= READING ARITHMETIC READPRDR MECHAPT TSPS (SYSMIS).			
EXECUTE. 

COUNT items_missing_EAS5 	= EAS5Score (SYSMIS).			
EXECUTE. 


DELETE VARIABLES 	ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score .


TITLE 'GM Apprentice RAMSAY & EAS-5 Validation Analyses'.
SUBTITLE 'Descriptives'.
DESCRIPTIVES VARIABLES=	READING ARITHMETIC READPRDR MECHAPT TSPS EAS5Score
   /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .



*Recoding to Eliminate Univariate Outliers on All Scales.
RECODE  	ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .


/*Composite score.

Numeric RAMSAY_cmp (f8.2) .

COMPUTE RAMSAY_cmp	= mean(ZREADING, ZARITHMETIC, ZREADPRDR, ZMECHAPT, ZTSPS).
EXECUTE.

VARIABLE LABELS
	RAMSAY_cmp		'RAMSAY Composite'.
EXECUTE.
	

DELETE VARIBLES  ZRAMSAY_cmp.


TITLE 'RAMSAY Composite Descriptives'.
DESCRIPTIVES
  VARIABLES= RAMSAY_cmp
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		


*IMPORTANT - To Eliminate Univariate Outliers on RAMSAY Composite.
RECODE  	ZRAMSAY_cmp
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .
	



**********************************************************************BEGIN CUMULATIVE GPA CREATION**************************************************************

COUNT items_missing_GPA 	= CumulativeGPA (SYSMIS).			
EXECUTE. 

***Recoding Outliers as SYSMIS.


DELETE VARIABLES 	ZCumulativeGPA .


SUBTITLE 'GPA Descriptives'.
DESCRIPTIVES
  VARIABLES= CumulativeGPA
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .
EXECUTE.



*Recoding to Eliminate Univariate Outliers on All Predictor Scales.
RECODE  	ZCumulativeGPA
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .



***************************************************PRELIMINARY ANALYSES*************************************************************************.
TITLE 'RAMSAY, EAS-5, & GPA histograms'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
FREQUENCIES
  VARIABLES=ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score ZCumulativeGPA
  /HISTOGRAM
  /ORDER=  ANALYSIS .

TITLE 'FINAL TMCB Correlation Table'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'FINAL TMCB Composite Correlation Table'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA
                        Ze3_CABER Zint_stay 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'FINAL TMCB (1,3,1) correlations with RAMSAY and EAS-5'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        WITH 
                        ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



TITLE 'FINAL RAMSAY and EAS-5 intercorrelations'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



TITLE 'FINAL RAMSAY and EAS-5 CORRELATIONS WITH GPA'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
                        WITH 
                        ZCumulativeGPA
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'Full correlation table between all scales and criteria'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score ZCumulativeGPA
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



TITLE 'Correlations for Test X Dimension Spreadsheet_3.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES=	ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score ZCumulativeGPA
                     	WITH
		ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .

**********************************************************RAMSAY REGRESSIONS***************************************************************************************


TITLE 'GM Apprentice RAMSAY hierarchical regression: Individual RAMSAY tests predicting the overall RAMSAY score'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT ZRAMSAY_cmp 
  /METHOD=ENTER ZREADING  /METHOD=ENTER ZARITHMETIC  /METHOD=ENTER ZREADPRDR  /METHOD=ENTER ZMECHAPT  /METHOD=ENTER ZTSPS .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice RAMSAY hierarchical regression: Individual RAMSAY tests and EAS5 predicting the overall TMCB score'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT ZTMCB_ovr2 
  /METHOD=ENTER ZREADING  /METHOD=ENTER ZARITHMETIC  /METHOD=ENTER ZREADPRDR  /METHOD=ENTER ZMECHAPT  /METHOD=ENTER ZTSPS  /METHOD=ENTER ZEAS5Score .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice RAMSAY hierarchical regression: Individual RAMSAY tests predicting the TMCB - WRJ score'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zwrj_cmp2 
  /METHOD=ENTER ZREADING  /METHOD=ENTER ZARITHMETIC  /METHOD=ENTER ZREADPRDR  /METHOD=ENTER ZMECHAPT  /METHOD=ENTER ZTSPS .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice RAMSAY hierarchical regression: Individual RAMSAY tests predicting the overall TMCB - WSD score'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zdsp_cmp2 
  /METHOD=ENTER ZREADING  /METHOD=ENTER ZARITHMETIC  /METHOD=ENTER ZREADPRDR  /METHOD=ENTER ZMECHAPT  /METHOD=ENTER ZTSPS .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'GM Apprentice RAMSAY hierarchical regression: Individual RAMSAY tests predicting the overall TMCB - BE score'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zbe_cmp2 
  /METHOD=ENTER ZREADING  /METHOD=ENTER ZARITHMETIC  /METHOD=ENTER ZREADPRDR  /METHOD=ENTER ZMECHAPT  /METHOD=ENTER ZTSPS .
FILTER OFF.
USE ALL.
EXECUTE .



***************************Lilly requested additional analyses 2.22.2008


TITLE 'FINAL RAMSAY CORRELATIONS WITH Technical Skills, Technical Knowledge, Troubleshooting Equipment, and Enter/Receive on computer'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS 
                        WITH 
                        Zal_avg Zts_avg Ztk_avg ZTroubleshootEquipment ZEnterReceiveonComputer
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


****************************Evan requested analyses 2.26.2008

USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
FREQUENCIES
  VARIABLES=
  /HISTOGRAM
  /ORDER=  ANALYSIS .

TITLE 'FINAL TMCB Correlation Table'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq 
                        WITH 
                        ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score ZCumulativeGPA
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .

****************************Additional Archival analyses 3.07.2008

/* Hand entered ArchivalQuantity, ArchivalQuality, ArchivalAbilityToLearn, ArchivalRelations, & ArchivalOvrPerf into dataset



DELETE VARIABLES 	ZArchivalQuantity ZArchivalQuality ZArchivalAbilityToLearn ZArchivalRelations ZArchivalOvrPerf .


SUBTITLE 'Archival Descriptives'.
DESCRIPTIVES
  VARIABLES= ArchivalQuantity ArchivalQuality ArchivalAbilityToLearn ArchivalRelations ArchivalOvrPerf 
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX .
EXECUTE.

*To Eliminate Univariate Outliers 
RECODE
	ZArchivalQuantity ZArchivalQuality ZArchivalAbilityToLearn ZArchivalRelations ZArchivalOvrPerf 
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE.



*********correlations with archival data


TITLE 'correlations with archival performance data'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
		Ze3_CABER Zint_stay
                         WITH 
                        ZArchivalQuantity ZArchivalQuality ZArchivalAbilityToLearn ZArchivalRelations ZArchivalOvrPerf 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .






*****************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************
**********************************************************************************BEGIN EXPERIMENTAL ITEM ANALYSES*****************************************************************************************
*****************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************
***************************BEGIN TMCB EXPERIMENTAL ITEMS ITEM-LEVEL SCORING***************************.

RECODE rc108 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR1 .
RECODE rc109 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR2 .
RECODE rc110 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR3 .
RECODE rc111 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR4 .
RECODE rc112 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR5 .
RECODE rc113 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR6 .
RECODE rc114 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR7 .
RECODE rc115 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR8 .
RECODE rc116 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR9 .
RECODE rc117 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR10 .
RECODE rc118 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR11 .
RECODE rc119 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR12 .
RECODE rc120 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR13 .
RECODE rc121 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR14 .
RECODE rc122 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR15 .
RECODE rc123 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR16 .
RECODE rc124 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR17 .
RECODE rc125 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR18 .
RECODE rc126 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR19 .
RECODE rc127 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR20 .
RECODE rc128 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR21 .
RECODE rc129 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR22 .
RECODE rc130 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR23 .
RECODE rc131 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into CR24 .
RECODE rc132 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into ER1 .
RECODE rc133 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into ER2 .
RECODE rc134 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into ER3 .
RECODE rc135 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into ER4 .
RECODE rc136 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into ER5 .
RECODE rc137 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into ER6 .
RECODE rc138 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into ER7 .
RECODE rc139 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into ER8 .
RECODE rc140 (1=1) (2=2) (3=3) (4=4) (5=5) (else=sysmis) into ER9 .

/*Labeling experimental items

VARIABLE LABELS
CR1	'156 - CR WORK ETHIC PROBLEM 1 (INCORRECT) - The company is about to go under.'
CR2	'157 - CR WORK ETHIC PROBLEM 1 - The small company next door is going to hire more people.'
CR3	'158 - CR WORK ETHIC PROBLEM 1 (CORRECT) - Both the company and employees will need to work harder before the company will be profitable.'
CR4	'159 - CR WORK ETHIC PROBLEM 1 - The company will hire temporary workers.'
CR5	'160 - CR WORK ETHIC PROBLEM 2 - The new employee is planning to arrive at work early each morning.'
CR6	'161 - CR WORK ETHIC PROBLEM 2 (INCORRECT) - The new employee wants to become friends with Kate so she has someone to talk to when she doesn’t feel like working.'
CR7	'162 - CR WORK ETHIC PROBLEM 2 - The new employee has a better work area than Kate.'
CR8	'163 - CR WORK ETHIC PROBLEM 2 (CORRECT) -The new employee is watching Kate because she wants to learn Kate’s work ethic.'
CR9	'164 - CR WORK ETHIC PROBLEM 3 - Productivity would increase if employees were given company cars.'
CR10	'165 - CR WORK ETHIC PROBLEM 3 (CORRECT) - Productivity would increase if managers checked on employees just once a day… employees could get more work done with minimal distraction.'
CR11	'166 - CR WORK ETHIC PROBLEM 3 (INCORRECT) - Productivity would increase if work load was distributed among more employees.'
CR12	'167 - CR WORK ETHIC PROBLEM 3 - Productivity would increase if company offices would get remodeled.'
CR13	'168 - CR WORK ETHIC PROBLEM 4 - Safety awareness courses will become more popular.'
CR14	'169 - CR WORK ETHIC PROBLEM 4 (CORRECT) - Employees who attend training are willing to put in extra time and effort in order to learn the material better.'
CR15	'170 - CR WORK ETHIC PROBLEM 4 (INCORRECT) - Employees who attend training are doing it because they want management to notice.'
CR16	'171 - CR WORK ETHIC PROBLEM 4 - More training courses will be offered over the next 10 years.'
CR17	'172 - CR WORK ETHIC PROBLEM 5 - Not much work gets done on Mondays.'
CR18	'173 - CR WORK ETHIC PROBLEM 5 - Most employees use only a half an hour for lunch.'
CR19	'174 - CR WORK ETHIC PROBLEM 5 (CORRECT) - Managers have been working extra hard Monday - Thursday so they can get extra time off.'
CR20	'175 - CR WORK ETHIC PROBLEM 5 (INCORRECT) - Managers have been dumping extra work on the administrative assistants so they can get extra time off.'
CR21	'176 - CR WORK ETHIC PROBLEM 6 (CORRECT) - If employees tried harder, the amount of stolen merchandise could decrease.'
CR22	'177 - CR WORK ETHIC PROBLEM 6 - Stores will stock more summer merchandise during the shopping season.'
CR23	'178 - CR WORK ETHIC PROBLEM 6 - Stores will not stay open as long during the shopping season.'
CR24	'179 - CR WORK ETHIC PROBLEM 6 (INCORRECT) - Overall, the retail companies can do little about the increase in stolen merchandise.'
ER1	'147 - ENERGY/RESLIENCE ITEM 1 - I rarely have difficulty retaining focus on complex mental tasks.'
ER2	'148 - ENERGY/RESLIENCE ITEM 2 - On previous job activities, I have been able to continue working at the same pace even though I have felt burnt out.'
ER3	'149 - ENERGY/RESLIENCE ITEM 3 - I like to engage in mental challenges that help me to sharpen my focusing skills.'
ER4	'150 - ENERGY/RESLIENCE ITEM 4 - I often find it difficult to concentrate on my tasks when working with other team members who appear emotionally drained.'
ER5	'151 - ENERGY/RESLIENCE ITEM 5 - I prefer jobs where I do not need to show a great deal of emotion.'
ER6	'152 - ENERGY/RESLIENCE ITEM 6 - I get bored easily by jobs that do not require me to make decisions often.'
ER7	'153 - ENERGY/RESLIENCE ITEM 7 - I find it difficult working with people that seem to have a great deal more energy than me.'
ER8	'154 - ENERGY/RESLIENCE ITEM 8 - When currently working on more than one task, I find it easy to focus on a new task that I have been assigned.'
ER9	'155 - ENERGY/RESLIENCE ITEM 9 - I believe that the best leaders are those that increase my level of excitement for the job.'.
EXECUTE.


VALUE LABELS CR1 to CR24
1	'Very Unlikely'
2	'Somewhat Unlikely'
3	'Neither Likely nor Unlikely'
4	'Somewhat Likely'
5	'Very Likely'.
EXECUTE.


VALUE LABELS ER1 to ER9
1	'Strongly Disagree'
2	'Disagree'
3	'Neither Agree nor Disagree'
4	'Agree'
5	'Strongly Agree'.
EXECUTE.



COUNT EXP_items_missing 	= CR1 to ER9 (sysmis).			
EXECUTE. 


*Recoding Experimental Item Outliers as SYSMIS.

*Cleaning Up Standardized Variables - This is Important to Keep You From Creating New Standardized Variables Rather than Replacing the Old.
*NOTE: The First Time, You Will Get an Error (b/c the Standardized Variables Have Not Yet Been Created).

DELETE VARIABLES 	ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
                                    ZER1 ZER2 ZER3 ZER4 ZER5 ZER6 ZER7 ZER8 ZER9 .



*Run This to Base the Standardized Variables on Cases Remaining After the _EXP_ Filters.

USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .


TITLE 'experimental items descriptives'.
DESCRIPTIVES
  VARIABLES=CR1 CR2 CR3 CR4 CR5 CR6 CR7 CR8 CR9 CR10 CR11 CR12 CR13 CR14 CR15 CR16 CR17 CR18 CR19 CR20 CR21 CR22 CR23 CR24 
                      ER1 ER2 ER3 ER4 ER5 ER6 ER7 ER8 ER9 
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX KURTOSIS SKEWNESS .


/*This Counts The Outliers For Use in a Filter.
RECODE 	ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
                        ZER1 ZER2 ZER3 ZER4 ZER5 ZER6 ZER7 ZER8 ZER9 
                        (Lowest thru -3.29 = 1) (3.29 thru Highest = 1) (ELSE = 0)
	            INTO
	            out101 to out133.
COMPUTE EXP_count_outliers = sum(out101 to out133).
EXECUTE.


**Deleting outlier variables 
DELETE VARIABLES 	out101 to out133. 



*Recoding to Eliminate Univariate Outliers on All Experimental Items.
RECODE  	ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
                        ZER1 ZER2 ZER3 ZER4 ZER5 ZER6 ZER7 ZER8 ZER9 
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .



/*Composite Scale Scores.

Numeric CR_WE_correct_cmp CR_WE_incorrect_cmp CR_WE_notscored_cmp ER_cmp  (f8.2) .

COMPUTE CR_WE_correct_cmp	= mean(ZCR3, ZCR8, ZCR10, ZCR14, ZCR19, ZCR21).
COMPUTE CR_WE_incorrect_cmp	= mean(ZCR1, ZCR6, ZCR11, ZCR15, ZCR20, ZCR24).
COMPUTE CR_WE_notscored_cmp	= mean(ZCR2, ZCR4, ZCR5, ZCR7, ZCR9, ZCR12, ZCR13, ZCR16, ZCR17, ZCR18, ZCR22, ZCR23).
COMPUTE ER_cmp			= mean(ZER1, ZER2, ZER3, ZER4, ZER5, ZER6, ZER7, ZER8, ZER9).
EXECUTE.	


DELETE VARIBLES ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp .

*Standardizing Based on Cases Remaining After the _EXP_ Filters.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .

TITLE 'Scale Experimental Composite Descriptives'.
DESCRIPTIVES
  VARIABLES= CR_WE_correct_cmp CR_WE_incorrect_cmp CR_WE_notscored_cmp ER_cmp 
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		


*IMPORTANT - To Eliminate Univariate Outliers on All Experimental Composites.
RECODE  	ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp 
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .
	

VARIABLE LABELS
	CR_WE_correct_cmp		'CR WORK ETHIC (Correct) Scale Composite'
	CR_WE_incorrect_cmp		'CR WORK ETHIC (Incorrect) Scale Composite'
	CR_WE_notscored_cmp		'CR WORK ETHIC (NotScored) Scale Composite'
            ER_cmp			'ENERGY/RESLIENCE Scale Composite'.
EXECUTE.


FILTER OFF.
USE ALL.
EXECUTE .



****************************************************************BEGIN EXPERIMENTAL ITEM FILTER CREATION*******************************************.

*************************
EXPERIMENTAL ITEM FILTERS -- ('1' is filtered OUT of sample)
*************************


RECODE EXP_items_missing  	(4 thru highest= 1)  (ELSE=0) 		INTO EXP_items_missing_filter .
RECODE EXP_count_outliers 	(2 thru Highest = 1) (ELSE = 0)		INTO EXP_outliers_filter.
*RECODE Version_Code		(1 = 0) (else = 1) 			INTO Version_Code_filter.
exe.


COMPUTE EXP_filters = sum(EXP_items_missing_filter, EXP_outliers_filter).
RECODE EXP_filters (0 = 0) (ELSE = 1). 
EXECUTE .

/*re-run experimental item syntax using the EXP_filters

*************************
FINAL SAMPLE FILTER -- ('0' is filtered OUT of sample)
*************************


delete variables exp_samp_filter exp_samp_filter_temp .

COMPUTE exp_samp_filter_temp = sum(pred_filters, crit_filters, matched_filter, EXP_filters).
RECODE exp_samp_filter_temp (0 = 1) (ELSE = 0).
EXECUTE.

RENAME VARIABLES (exp_samp_filter_temp = exp_samp_filter).
EXECUTE.

variable labels
exp_samp_filter 'FINAL EXPERIMENTAL ITEM SAMPLE FILTER'.
exe.

value labels exp_samp_filter
0 'Filtered OUT of sample'
1 'Included in sample'.
exe.



********************************************************************RELIABILITY ANALYSES*******************************************************************.
Title 'CR WORK ETHIC (Correct) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR3 ZCR8 ZCR10 ZCR14 ZCR19 ZCR21
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* drop ZCR21 (from CR WE problem 6)? -- negative correlations with the other items



Title 'CR WORK ETHIC (Incorrect) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR1 ZCR6 ZCR11 ZCR15 ZCR20 ZCR24
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* drop ZCR6 (from CR WE problem 2) ZCR11 (from CR WE problem 3)? -- low correlations with other items



Title 'CR WORK ETHIC (NotScored) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR2 ZCR4 ZCR5 ZCR7 ZCR9 ZCR12 ZCR13 ZCR16 ZCR17 ZCR18 ZCR22 ZCR23
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* drop ZCR5 (from CR WE problem 2) and ZCR18 (from CR WE problem 5)? -- negative correlations with other items



Title 'Energy/Resience Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZER1 ZER2 ZER3 ZER4 ZER5 ZER6 ZER7 ZER8 ZER9
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* drop ZER5 and ZER6? -- negative correlations with other items



********************************************************************FACTOR ANALYSES************************************************************************.
Title 'Exploratory PCA'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
FACTOR
  /VARIABLES ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12
                      ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
  /MISSING LISTWISE 
  /ANALYSIS ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9
                    ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21
                    ZCR22 ZCR23 ZCR24
  /PRINT INITIAL EXTRACTION ROTATION 
  /FORMAT SORT
  /PLOT EIGEN ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(100)
  /EXTRACTION PC
  /CRITERIA ITERATE(100)
  /ROTATION VARIMAX
  /METHOD=CORRELATION .
FILTER OFF.
USE ALL.
EXECUTE .


Title 'PCA - forced 3 factors'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
FACTOR
  /VARIABLES ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12
                      ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
 /MISSING LISTWISE 
 /ANALYSIS ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9
                   ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21
                   ZCR22 ZCR23 ZCR24
  /PRINT INITIAL EXTRACTION ROTATION 
  /FORMAT SORT BLANK(.10)
  /PLOT EIGEN ROTATION
  /CRITERIA FACTORS(3) ITERATE(100)
  /EXTRACTION PC
  /CRITERIA ITERATE(100)
  /ROTATION VARIMAX
  /METHOD=CORRELATION .
FILTER OFF.
USE ALL.
EXECUTE .




********************************************************************* PRELIM. CORRELATIONS *****************************************************************************.

TITLE ' histograms'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
FREQUENCIES
  VARIABLES=ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp 
	          ZCR3 ZCR8 ZCR10 ZCR14 ZCR19 ZCR21
                      ZCR1 ZCR6 ZCR11 ZCR15 ZCR20 ZCR24
                      ZCR2 ZCR4 ZCR5 ZCR7 ZCR9 ZCR12 ZCR13 ZCR16 ZCR17 ZCR18 ZCR22 ZCR23
                      ZER1 ZER2 ZER3 ZER4 ZER5 ZER6 ZER7 ZER8 ZER9
  /HISTOGRAM
  /ORDER=  ANALYSIS .
FILTER OFF.
USE ALL.
EXECUTE .


TITLE 'prelim Intercorrelations'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
CORRELATIONS
  /VARIABLES= ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



TITLE 'prelim correlations'.
USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA ZTMCB_ovr2 Ze3_CABER Zint_stay 
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


********************************************************************RELIABILITY ANALYSES (round 2)*******************************************************************.


Title 'CR WORK ETHIC (Correct) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR3 ZCR8 ZCR10 ZCR14 ZCR19
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* dropped ZCR21 (from CR WE problem 6) because of negative correlations with the other items



Title 'CR WORK ETHIC (Incorrect) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR1 ZCR15 ZCR20 ZCR24
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* dropped ZCR6 (from CR WE problem 2) ZCR11 (from CR WE problem 3) because of low correlations with other items



Title 'CR WORK ETHIC (NotScored) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR2 ZCR4 ZCR7 ZCR9 ZCR12 ZCR13 ZCR16 ZCR17 ZCR22 ZCR23
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* dropped ZCR5 (from CR WE problem 2) and ZCR18 (from CR WE problem 5) because of negative correlations with other items



Title 'Energy/Resience Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZER1 ZER2 ZER3 ZER4 ZER7 ZER8 ZER9
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* dropped ZER5 and ZER6 because of negative correlations with other items


***************All are at an acceptable level except CR WE Incorrect**************


Title 'PCA - forced 3 factors -- ALL ITEMS -- GOOD SCREE PLOT SHOWING 3 FACTORS'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
FACTOR
  /VARIABLES ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9 ZCR10 ZCR11 ZCR12
                      ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21 ZCR22 ZCR23 ZCR24
 /MISSING LISTWISE 
 /ANALYSIS ZCR1 ZCR2 ZCR3 ZCR4 ZCR5 ZCR6 ZCR7 ZCR8 ZCR9
                   ZCR10 ZCR11 ZCR12 ZCR13 ZCR14 ZCR15 ZCR16 ZCR17 ZCR18 ZCR19 ZCR20 ZCR21
                   ZCR22 ZCR23 ZCR24
  /PRINT INITIAL EXTRACTION ROTATION 
  /FORMAT SORT BLANK(.10)
  /PLOT EIGEN ROTATION
  /CRITERIA FACTORS(3) ITERATE(100)
  /EXTRACTION PC
  /CRITERIA ITERATE(100)
  /ROTATION VARIMAX
  /METHOD=CORRELATION .
FILTER OFF.
USE ALL.
EXECUTE .



Title 'PCA - forced 3 factors -- ITEMS DROPPED'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
FACTOR
  /VARIABLES ZCR3 ZCR8 ZCR10 ZCR14 ZCR19
                      ZCR1 ZCR15 ZCR20 ZCR24
	          ZCR2 ZCR4 ZCR7 ZCR9 ZCR12 ZCR13 ZCR16 ZCR17 ZCR22 ZCR23
 /MISSING LISTWISE 
 /ANALYSIS    ZCR3 ZCR8 ZCR10 ZCR10 ZCR14 ZCR19
                      ZCR1 ZCR15 ZCR20 ZCR24
	          ZCR2 ZCR4 ZCR7 ZCR9 ZCR12 ZCR13 ZCR16 ZCR17 ZCR22 ZCR23
  /PRINT INITIAL EXTRACTION ROTATION 
  /FORMAT BLANK(.10)
  /PLOT EIGEN ROTATION
  /CRITERIA FACTORS(3) ITERATE(100)
  /EXTRACTION PC
  /CRITERIA ITERATE(100)
  /ROTATION VARIMAX
  /METHOD=CORRELATION .
FILTER OFF.
USE ALL.
EXECUTE .



****************************************************************************************CREATE NEW COMPOSITES*********************************************************************************.


COMPUTE CR_WE_correct_cmp2	 	= mean(ZCR3, ZCR8, ZCR10, ZCR14, ZCR19).       	        /*no ZCR21.

COMPUTE CR_WE_incorrect_cmp2	 	= mean(ZCR1, ZCR15, ZCR20, ZCR24). 	        /*no ZCR6, ZCR11 .

COMPUTE CR_WE_notscored_cmp2	 	= mean(ZCR2, ZCR4, ZCR7, ZCR9, ZCR12, ZCR13, ZCR16, ZCR17, ZCR22, ZCR23). 	 /*no ZCR5, ZCR18 .

COMPUTE ER_cmp2				= mean(ZER1, ZER2, ZER3, ZER4, ZER7, ZER8, ZER9).	 /*no ZER5, ZER6 .


VARIABLE LABELS
	CR_WE_correct_cmp2		'CR WORK ETHIC (Correct) Scale Composite - NO ZCR21'
	CR_WE_incorrect_cmp2		'CR WORK ETHIC (Incorrect) Scale Composite - NO ZCR6, ZCR11'
	CR_WE_notscored_cmp2	'CR WORK ETHIC (NotScored) Scale Composite - NO ZCR5, ZCR18'
            ER_cmp2			'ENERGY/RESLIENCE Scale Composite - NO ZER5, ZER6'.
EXECUTE.


DELETE VARIBLES ZCR_WE_correct_cmp2 ZCR_WE_incorrect_cmp2 ZCR_WE_notscored_cmp2 ZER_cmp2 .


TITLE 'Scale Experimental Composite Descriptives'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
DESCRIPTIVES
  VARIABLES= CR_WE_correct_cmp2 CR_WE_incorrect_cmp2 CR_WE_notscored_cmp2 ER_cmp2 
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.
FILTER OFF.
USE ALL.
EXECUTE .
		


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
TITLE 'preliminary correlations between all adjusted compostites and criteria'.
CORRELATIONS
  /VARIABLES= ZCR_WE_correct_cmp2 ZCR_WE_incorrect_cmp2 ZCR_WE_notscored_cmp2 ZER_cmp2 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA ZTMCB_ovr2 Ze3_CABER Zint_stay 
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
TITLE 'preliminary between all original compostites and criteria'.
CORRELATIONS
  /VARIABLES= ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp ZER_cmp 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA ZTMCB_ovr2 Ze3_CABER Zint_stay 
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
TITLE 'INTERcorrelations between all adjusted compostites'.
CORRELATIONS
  /VARIABLES= ZCR_WE_correct_cmp2 ZCR_WE_incorrect_cmp2 ZCR_WE_notscored_cmp2 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



*******************************************************BEGIN EXPERIMENTAL ITEMS ITEM-LEVEL re-coding "incorrect" items********************************************************.

RECODE rc108 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR1_reverse_coded .
RECODE rc113 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR6_reverse_coded .
RECODE rc118 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR11_reverse_coded .
RECODE rc122 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR15_reverse_coded .
RECODE rc127 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR20_reverse_coded .
RECODE rc131 (1=5) (2=4) (3=3) (4=2) (5=1) (else=sysmis) into CR24_reverse_coded .

/*Labeling experimental items

VARIABLE LABELS
CR1_reverse_coded	'156 - CR WORK ETHIC PROBLEM 1 (INCORRECT) - The company is about to go under.'
CR6_reverse_coded	'161 - CR WORK ETHIC PROBLEM 2 (INCORRECT) - The new employee wants to become friends with Kate so she has someone to talk to when she doesn’t feel like working.'
CR11_reverse_coded	'166 - CR WORK ETHIC PROBLEM 3 (INCORRECT) - Productivity would increase if work load was distributed among more employees.'
CR15_reverse_coded	'170 - CR WORK ETHIC PROBLEM 4 (INCORRECT) - Employees who attend training are doing it because they want management to notice.'
CR20_reverse_coded	'175 - CR WORK ETHIC PROBLEM 5 (INCORRECT) - Managers have been dumping extra work on the administrative assistants so they can get extra time off.'
CR24_reverse_coded	'179 - CR WORK ETHIC PROBLEM 6 (INCORRECT) - Overall, the retail companies can do little about the increase in stolen merchandise.'.
EXECUTE.


VALUE LABELS CR1_reverse_coded to CR24_reverse_coded
1	'Very Unlikely'
2	'Somewhat Unlikely'
3	'Neither Likely nor Unlikely'
4	'Somewhat Likely'
5	'Very Likely'.
EXECUTE.


DELETE VARIABLES 	ZCR1_reverse_coded ZCR6_reverse_coded ZCR11_reverse_coded ZCR15_reverse_coded ZCR20_reverse_coded ZCR24_reverse_coded.



TITLE '"incorrect" reverse coded items descriptives'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
DESCRIPTIVES
  VARIABLES=CR1_reverse_coded CR6_reverse_coded CR11_reverse_coded CR15_reverse_coded CR20_reverse_coded CR24_reverse_coded
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX KURTOSIS SKEWNESS .



*Recoding to Eliminate Univariate Outliers.
RECODE  	ZCR1_reverse_coded ZCR6_reverse_coded ZCR11_reverse_coded ZCR15_reverse_coded ZCR20_reverse_coded ZCR24_reverse_coded
  	(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .



/*Composite Scale Scores.

Numeric CR_WE_incorrect_cmp_reverse_coded (f8.2) .

COMPUTE CR_WE_incorrect_cmp_reverse_coded	= mean(ZCR1_reverse_coded, ZCR6_reverse_coded, ZCR11_reverse_coded, ZCR15_reverse_coded, ZCR20_reverse_coded, ZCR24_reverse_coded).
EXECUTE.	


DELETE VARIBLES ZCR_WE_incorrect_cmp_reverse_coded .

USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
TITLE 'Scale "incorrect" reverse coded Composite Descriptives'.
DESCRIPTIVES
  VARIABLES= CR_WE_incorrect_cmp_reverse_coded
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		


*IMPORTANT - To Eliminate Univariate Outliers on All Experimental Composites.
RECODE  	ZCR_WE_incorrect_cmp_reverse_coded
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .
	

VARIABLE LABELS
	CR_WE_incorrect_cmp_reverse_coded		'CR WORK ETHIC (Incorrect) Scale Composite Reverse Coded'.
EXECUTE.


****composite variable with dropped items

Numeric CR_WE_incorrect_cmp_reverse_coded2 (f8.2) .

COMPUTE CR_WE_incorrect_cmp_reverse_coded2	= mean(ZCR1_reverse_coded, ZCR15_reverse_coded, ZCR20_reverse_coded, ZCR24_reverse_coded).	 /*no ZCR6_reverse_coded, ZCR11_reverse_coded .
EXECUTE.	

DELETE VARIBLES ZCR_WE_incorrect_cmp_reverse_coded2 .


USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
TITLE 'Scale "incorrect" reverse coded Composite Descriptives'.
DESCRIPTIVES
  VARIABLES= CR_WE_incorrect_cmp_reverse_coded2
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		



FILTER OFF.
USE ALL.
EXECUTE .




**************************************************************************************combining "correct" and "incorrect" into one composite***********************************************.
***reliability analyses

Title 'CR WORK ETHIC combined Correct & Incorrect (reverse coded) Reliability'.
USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
RELIABILITY
  /VARIABLES= ZCR3 ZCR8 ZCR10 ZCR14 ZCR19
                        ZCR1_reverse_coded ZCR6_reverse_coded ZCR11_reverse_coded ZCR15_reverse_coded ZCR20_reverse_coded ZCR24_reverse_coded
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA
  /STATISTICS=DESCRIPTIVE SCALE CORR
  /SUMMARY=TOTAL .
FILTER OFF.
USE ALL.
EXECUTE .

/* looks bad



***creating the composite "correct" and "incorrect" CR item composite variable


Numeric combined_CRvariable (f8.2) .

COMPUTE combined_CRvariable	= mean(ZCR1_reverse_coded, ZCR15_reverse_coded, ZCR20_reverse_coded, ZCR24_reverse_coded, ZCR3, ZCR8, ZCR10, ZCR14, ZCR19).
EXECUTE.	


DELETE VARIBLES Zcombined_CRvariable .

USE ALL.
COMPUTE filter_$=(EXP_filters = 0).
FILTER BY filter_$.
EXECUTE .
DESCRIPTIVES
  VARIABLES= combined_CRvariable
  /SAVE
  /STATISTICS=MEAN STDDEV .
EXECUTE.		


*IMPORTANT - To Eliminate Univariate Outliers on Composite.
RECODE  	Zcombined_CRvariable 
  		(Lowest thru -3.29=SYSMIS)  (3.29 thru Highest=SYSMIS).
EXECUTE .
	

VARIABLE LABELS
	combined_CRvariable		'combined "correct" & "incorrect" CR items composite variable'
	Zcombined_CRvariable		'Zscore: combined "correct" & "incorrect" CR items composite variable'.
EXECUTE.


FILTER OFF.
USE ALL.
EXECUTE .


***correlations

USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
TITLE 'preliminary correlations between all adjusted compostites and criteria'.
CORRELATIONS
  /VARIABLES= Zcombined_CRvariable ZCR_WE_correct_cmp2 ZCR_WE_incorrect_cmp2 CR_WE_incorrect_cmp_reverse_coded2 ZCR_WE_notscored_cmp2 ZER_cmp2 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline ZCumulativeGPA ZTMCB_ovr2 Ze3_CABER Zint_stay 
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score 
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .



**************************************************************************************EXPLORATORY ANALYSES: curvilinear relationships & moderation analyses**************************************************************
USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
GRAPH
  /SCATTERPLOT(BIVAR)=ZCR_WE_correct_cmp2 WITH Zovr_unit 
  /MISSING=LISTWISE .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
GRAPH
  /SCATTERPLOT(BIVAR)=ZCR_WE_incorrect_cmp2 WITH ZTMCB_ovr2 
  /MISSING=LISTWISE .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
GRAPH
  /SCATTERPLOT(BIVAR)=ZCR_WE_notscored_cmp2 WITH ZTMCB_ovr2 
  /MISSING=LISTWISE .
FILTER OFF.
USE ALL.
EXECUTE .


Curvilinear relationships?

USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
IGRAPH /VIEWNAME='Scatterplot' /X1 = VAR(ZCR_WE_correct_cmp2) TYPE = SCALE /Y =
  VAR(ZTMCB_ovr2) TYPE = SCALE /COORDINATE = VERTICAL  /FITLINE METHOD = LLR
  NORMAL BANDWIDTH = FAST X1MULTIPLIER = 1.00  X2MULTIPLIER = 1.00 LINE =
  TOTAL SPIKE=OFF /X1LENGTH=3.0 /YLENGTH=3.0 /X2LENGTH=3.0 /CHARTLOOK='NONE'
 /SCATTER COINCIDENT = NONE.
EXE.
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
IGRAPH /VIEWNAME='Scatterplot' /X1 = VAR(ZCR_WE_incorrect_cmp2) TYPE = SCALE /Y =
  VAR(ZTMCB_ovr2) TYPE = SCALE /COORDINATE = VERTICAL  /FITLINE METHOD = LLR
  NORMAL BANDWIDTH = FAST X1MULTIPLIER = 1.00  X2MULTIPLIER = 1.00 LINE =
  TOTAL SPIKE=OFF /X1LENGTH=3.0 /YLENGTH=3.0 /X2LENGTH=3.0 /CHARTLOOK='NONE'
 /SCATTER COINCIDENT = NONE.
EXE.
FILTER OFF.
USE ALL.
EXECUTE .



USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
IGRAPH /VIEWNAME='Scatterplot' /X1 = VAR(ZCR_WE_notscored_cmp2) TYPE = SCALE /Y =
  VAR(ZTMCB_ovr2) TYPE = SCALE /COORDINATE = VERTICAL  /FITLINE METHOD = LLR
  NORMAL BANDWIDTH = FAST X1MULTIPLIER = 1.00  X2MULTIPLIER = 1.00 LINE =
  TOTAL SPIKE=OFF /X1LENGTH=3.0 /YLENGTH=3.0 /X2LENGTH=3.0 /CHARTLOOK='NONE'
 /SCATTER COINCIDENT = NONE.
EXE.
FILTER OFF.
USE ALL.
EXECUTE .


******************interaction analyses*********************


COMPUTE interaction = ZCR_WE_correct_cmp * ZCR_WE_incorrect_cmp .
EXECUTE .
COMPUTE interaction2 = ZCR_WE_correct_cmp * ZCR_WE_notscored_cmp .
EXECUTE .
COMPUTE interaction3 = ZCR_WE_incorrect_cmp * ZCR_WE_notscored_cmp .
EXECUTE .
COMPUTE interaction4 = ZCR_WE_incorrect_cmp * ZCR_WE_notscored_cmp * ZCR_WE_correct_cmp  .
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT ZTMCB_ovr2 
  /METHOD=ENTER ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp  /METHOD=ENTER interaction interaction2 interaction3  /METHOD=ENTER interaction4  .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Zovr_unit 
  /METHOD=ENTER ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp  /METHOD=ENTER interaction interaction2 interaction3  /METHOD=ENTER interaction4  .
FILTER OFF.
USE ALL.
EXECUTE .

USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT ZCumulativeGPA
  /METHOD=ENTER ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp  /METHOD=ENTER interaction interaction2 interaction3  /METHOD=ENTER interaction4  .
FILTER OFF.
USE ALL.
EXECUTE .


USE ALL.
COMPUTE filter_$=exp_samp_filter.
FILTER BY filter_$ .
EXECUTE .
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA CHANGE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN
  /DEPENDENT Ze3_CABER 
  /METHOD=ENTER ZCR_WE_correct_cmp ZCR_WE_incorrect_cmp ZCR_WE_notscored_cmp  /METHOD=ENTER interaction interaction2 interaction3  /METHOD=ENTER interaction4  .
FILTER OFF.
USE ALL.
EXECUTE .



*************for database of life

TITLE 'Full correlation table between all scales and criteria'.
USE ALL.
COMPUTE filter_$=val_samp.
FILTER BY filter_$ .
EXECUTE .
CORRELATIONS
  /VARIABLES= ZTMCB_ovr2 Zwrj_cmp2 Zdsp_cmp2 Zbe_cmp2 
                        Zsji_sit Zab_sf Zab_qa Zab_coll Zdsp_ad Zdsp_jfs Zdsp_lc Zdsp_se Zdsp_dm Zdsp_wq Zbe_adpt Zbe_ws 
                        WITH 
                        Zovr_unit Zcando Zwilldo Zinterp Zbottomline 
                        Zal_avg Zcollab_avg Zcomm_avg Zcl_avg Zqo_avg Zsa_avg Zts_avg Zws_avg Ztk_avg
	            ZAttendance ZSpeedtoPerformance ZAvoidMisuseofTime ZAdvancethroughProgram ZTroubleshootEquipment ZEnterReceiveonComputer
                        Ze3_CABER Zint_stay
		ZRAMSAY_cmp ZREADING ZARITHMETIC ZREADPRDR ZMECHAPT ZTSPS ZEAS5Score ZCumulativeGPA
  /PRINT=ONETAIL NOSIG
  /MISSING=PAIRWISE .
FILTER OFF.
USE ALL.
EXECUTE .






