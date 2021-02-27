********************************************************************
*  TITLE :      Homework #7                                        
*                                                                  
*  DESCRIPTION: SAS code for all questions                         
*                                                                  
*-------------------------------------------------------------------
*  JOB NAME:    HW4.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.1                                    
*                                                                   
*  NAME:        Ivan Knowles                             
*  DATE:        03/08/17                                             
*-------------------------------------------------------------------
*                                                                   
*  Honor Code Pledge:  I have neither given nor received           
*  unauthorized assistance in completion of this assignment.        
*                                                                   
*  Signature:   Ivan Knowles                 
*                                                                   
********************************************************************;

footnote "Job HW7.SAS run by Ivan Knowles on &SYSDATE at &SYSTIME" ;

options nodate ls=95 ps=54 formchar="|----|+|---+=|-/\<>*";

libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

title 'Homework #7';


/* Question 1 */
proc means data=math2500.lrc120 median mean std maxdec=2;
    var bmi chol ldl;
    title2 'Question 1';
    title3 'Selected statistics for selected variables in lrc120';
    title4 'Displaying two decimal places';
run;


/* Question 2 */
proc means data=math2500.lrc120 noprint;
    class trt regex;
    var chol hdl ldl;
    output  out=meansout
            n=NChol NHDL NLDL
            mean=MeanChol MeanHDL MeanLDL;
    /* or could use something like this OUTPUT statement:
    output out=meansout n= mean= / autoname;
    */
run;
proc print data=meansout; 
    title2 'Question 2';
    title3 'Selected Statistics for Chol, HDL, and LDL by Treatment Group and Regular Exercise Status';
run;
/*question 3*/

proc gplot data= math2500.lrc120;
plot regex*bmi;
Title2 'Relationship between regex(regular excercise) and bmi';
run; 


/*question 4*/

proc gplot data = math2500.lrc120;
plot bmi*age=regex;
run;


/*question 5*/
proc contents data = math2500.lrc120;
run;

proc means data = math2500.lrc120 median;
class smoke;
var hdl;
run;

/*question 6*/

proc means data=math2500.lrc120;
where smoke <=0;
class smoke;
var ldl;
run;

/*question 7*/

proc freq data = math2500.lrc120;
tables trt * regex;
title 'percent that excercises regulary';
run;
 


/*question 8*/
axis1 label = ('People who have tradmill angina') order= (0 to 5);
proc gchart data = math2500.lrc120;
vbar TMA/ raxis=axis1;
title ' Number of people with treadmill angina';
where TMA >=1; 
run;

/*question 9*/
proc freq data = math2500.lrc120;
tables smoke/missing;
tables smoke;
title ' Percent of smokers that include or exclude the denominator';
run;


/*question 10*/
axis1 order= (0 to 3 by 1);
proc gchart data = math2500.lrc120;
vbar ldl/ raxis=axis1 ;
where ldl <= 115;
title ' Five lowest values of ldl';
run;
quit;


/*question 11*/
axis1 label = ('Frequency') order = ( 0 to 40 by 5);
proc gchart data = math2500.lrc120;
vbar educ/ discrete raxis=axis1 width=8 inside=percent outside=freq;
where educ <=4;
title ' Percent of people with had at least as much education as a high school dergee';
run;
quit;

/*question 12*/

proc freq data = math2500.lrc120;
tables comp *vis ;
where comp <=0;
title 'People who had gxt by visual coding that did not have a gxt by computer coding';
run;








