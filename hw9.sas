********************************************************************
*  TITLE :      Homework #9                                        
*                                                                  
*  DESCRIPTION: SAS code for all questions                         
*                                                                  
*-------------------------------------------------------------------
*  JOB NAME:    HW4.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.1                                    
*                                                                   
*  NAME:        Ivan Knowles                             
*  DATE:        04/10/17                                             
*-------------------------------------------------------------------
*                                                                   
*  Honor Code Pledge:  I have neither given nor received           
*  unauthorized assistance in completion of this assignment.        
*                                                                   
*  Signature:   Ivan Knowles                 
*                                                                   
********************************************************************;

libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';
/* Problem 1*/
data tickets;
input speeds @@;
datalines;
 70    48    41    68    69    55    70    57    60    83
32    60    72    58    88    48    59    60    56    65
66    60    68    42    57    59    49    70    75    63
44 
;
run;

proc ttest data = tickets H0=60 alpha=0.01 sides=2;
	var speeds;
	Title 'Problem 1';
run;


/*Problem 2*/

data school days;
input daysmissed @@;
datalines;
0	3	6	3	3	5	4	1	3	5
7	3	1	2	3	3	2	4	1	6
2	5	2	8	3	1	2	5	4	1
1	1	2	1	5	7	5	4	9	3
;
run;

proc ttest data = school H0=5 ALPHA=.05 SIDES=L;
	var daysmissed;
	Title 'Problem 2';
run;

/* Problem 3 */

data tomatoe;
input tomatoes @@;
datalines;
0.31    0.47    0.19    0.72    0.56
0.91    0.29    0.83    0.49    0.28
0.31    0.46    0.25    0.34    0.17
0.58    0.19    0.26    0.47    0.81
;
run;

proc ttest data = tomatoe HO=.4 ALPHA=.05 SIDES=L;
	var tomatoes;
	Title 'Problem 3';
run;

/*Problem 4 */

data weight;
input weights @@;
datalines;
147
138
162
151
134
189
157
144
175
175
127
164
;
run;

proc ttest data = weight HO=149 ALPHA=.05 SIDES=L;
	var weights;
	Title 'Problem 4';
run;

/* Problem 5 */

data printer;
input printers @@;
datalines;
9771 9811 9885 9914
9975 10079 10145 10214
;
run;

proc ttest data = printer H0=10000 ALPHA=.10 SIDES=L;
var printers;
title 'Problem 5';
run;

/* Problem 6 */
data students;
input day $ night;
datalines;
d  22    d  24    d  24    d  23    d  19    d  19    d  23    d  22    d  18    d  21    d  21    d  18
d  18    d  25    d  29    d  24    d  23    d  22    d  22    d  21    d  20    d  20    d  20    d  27
d  17    d  19    d  18    d  21    d  20    d  23    d  26    d  30    d  25    d  21    d  25
n  18    n  23    n  25    n  23    n  21    n  21    n  23    n  24    n  27    n  31    n  24    n  20
n  20    n  23    n  19    n  25    n  24    n  27    n  23    n  20    n  20    n  21    n  25    n  24
n  23    n  28    n  20    n  19    n  23    n  24    n  20    n  27    n  21    n  29    n  30 
;
run;


proc ttest data=students;
	class day;
	var night;
	title 'Problem 6';
run;

/* problem 7*/

data finance;
input nasdaq $ nyse;
datalines;
n 2.00 
n 1.02 
n 2.11 
n 2.56 
n 2.15 
n 0.93 
n 0.91 
n 1.67 
n 1.88 
n 2.13
n 2.44 
n 1.97 
n 2.00 
n 1.81 
n 2.25 
n 1.72 
n 1.75 
n 1.05 
n 0.90 
n 2.34
n 0.51 
n 1.00 
n 2.25 
n 0.85 
n 1.50 
n 2.33 
n 1.59 
n 2.25 
n 0.23 
n 1.63
y 1.46 
y 3.00 
y 1.74 
y 5.19 
y 1.69 
y 1.88 
y 2.85 
y 2.00 
y 2.19 
y 2.03
y 1.81 
y 5.00 
y 1.72 
y 3.38 
y 2.09 
y 4.50 
y 3.07 
y 1.97 
y 1.78 
y 1.50
y 1.97 
y 4.65  
y 3.12  
y 2.19 
y 2.19 
y 3.50 
y 1.56 
y 4.10 
y 3.00 
y 4.40
; 
run;

proc ttest data = finance;
class nasdaq;
var nyse;
title 'Problem 7';
run;

/* Problem 8 */
data golfers;
input female $ male;
datalines;
f  180000 f  150000 f  240000 f  195000 f  202500
f  120000 f  165000 f  225000 f  150000 f  315000
m  864000 m  810000 m  1170000 m  810000 m  630000
m  1050000 m  945000 m  1008000 m  900000 m  756000
m  630000 m  900000
;
run;

proc ttest data = golfers;
class female;
var male;
title 'Problem 8';
run;




/* Problem 9*/
data athelete;
input before after;
datalines;
215 225
240 245
188 188
212 210
275 282
260 275
225 230
200 195
285 190
;
run;

proc ttest data = athelete H0=0 SIDES=L;
title 'Problem 9';
paired before*after;
run;

/* Problem 10 */

data blood_pressure;
input before after;
datalines;
85 82
96 90
92 92
83 75
80 74
91 80
79 82
98 88
93 89
96 80
;
run;

proc ttest data = blood_pressure H0=0 ALPHA=.01 SIDES=L;
title 'Problem 10';
paired before*after;
run;
