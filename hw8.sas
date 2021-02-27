********************************************************************
*  TITLE :      Homework #8                                        
*                                                                  
*  DESCRIPTION: SAS code for all questions                         
*                                                                  
*-------------------------------------------------------------------
*  JOB NAME:    HW4.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.1                                    
*                                                                   
*  NAME:        Ivan Knowles                             
*  DATE:        03/27/17                                             
*-------------------------------------------------------------------
*                                                                   
*  Honor Code Pledge:  I have neither given nor received           
*  unauthorized assistance in completion of this assignment.        
*                                                                   
*  Signature:   Ivan Knowles                 
*                                                                   
********************************************************************;

libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

title 'Homework #8';

OPTIONS  NODATE NONUMBER LS=80 PS=45;



/* Define useful formats */
proc format;
    value ny        0='No'              1='Yes';
    value trtfmt    0='Placebo'         1='Drug';
    value agefmt    low-<40='Under 40'  40-50='40-50'   50<-high='Over 50';
    value ecgfmt    0='Low'             1='Medium'      2='High';   
    value gxtfmt    0='Normal'          1='Problematic';
    value $sexfmt   'f'='Female'        'm'='Male';
run;
----------*
   Part I
*----------*;
title2 'Part I';

/* First, make an analysis data set for this part of the assignment */

data part1;
    set math2500.lrc120;
    label   trt='Treatment'
            regex='Regular Exercise'
            chol='Cholesterol'
            hdl='HDL'
            ldl='LDL'
            gxt='GXT Result'
            bmi='BMI';
    format regex ny. trt trtfmt. smoke ny. gxt gxtfmt. age agefmt.;
run;

/* Table 1 */

proc tabulate data=part1 format=11.0;
    class trt gxt;
    table trt all,gxt all;
    title 'Table 1';
run;

/* Table 2 */

proc tabulate data = part1 format=11.0;
	var chol hdl ldl;
	class trt;
	table chol*(n mean) ldl*(n mean) hdl*(n mean), trt ALL;
	title 'Table 2';
run;


/* Table 3 */

proc tabulate data = part1 format=11.0;
var chol bmi;
class trt gxt; 
table trt*gxt, chol*(N MEAN) bmi*(MEDIAN);
title 'Table 3';
run;

/* Table 4 */

proc tabulate data= part1 format=11.0;
var hdl;
class regex trt;
table regex hdl*(n median), trt;
title 'Table 4';
run;

/* Table 5 */

proc tabulate data = part1 format=11.0;
label ldl = 'Mean LDL';
var ldl;
class trt;
title ' Table 5';
table trt all, ldl*(mean);
run;


*----------*
   Part II
*----------*;
Title' Part 2';

proc contents data=math2500.coronary;
run;
proc format;
    value ny        0='No'              1='Yes';
    value agefmt    low-<40='Under 40'  40-50='40-50'   50<-high='Over 50';
    value ecgfmt    0='Low'             1='Medium'      2='High';   
    value $sexfmt   'f'='Female'        'm'='Male';
run;

data part2;
    set math2500.coronary;
    label   age = 'Age Group'
			ca = 'Coronary artery disease'
			ecg = 'ECG'
			sex = 'Patient Sex';
format ca ny. age agefmt. ecg ecgfmt. sex sexfmt.;
run;

   

/* Table 6 */

proc tabulate data=part2 format=9.0 NOSEPS;
class ca age;
keylabel pctn = '%';
title ' Table 6';
table age ALL, ca ALL*(N*F=5.0 PCTN);              
run;

/* Table 7*/

proc tabulate data=part2 format=9.0 noseps;
class sex age ca;
keylabel pctn = '%';
title ' Table 7';
table sex*(age ALL), ca*(N*F=5.0 PCTN);
run;

/* Table 8*/

proc tabulate data=part2 format=9.0 noseps;
class sex ca;
title ' Table 8';
table sex, ca;
run;

/* Table 9*/
 proc tabulate data=part2 format=11.0 noseps;
 var age;
 Title ' Table 9';
 class sex ca ecg;
 table sex, ca*(age*(mean) ecg*(PCTN));
 run;
