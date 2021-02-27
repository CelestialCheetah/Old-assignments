*********************************************************************
*  TITLE:       Homework 6                                          
*                                                                    
*  DESCRIPTION: All questions                                          
*                                                                    
*                                                                    
*------------------------------------------------------------------- 
*  JOB NAME:    Lab2.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.4                                     
*                                                                    
*  NAME:        Ivan Knowles                                      
*  DATE:        03/06/2017                                              
*------------------------------------------------------------------- 
*                                                                    
*  Honor Code Pledge:  I have neither given nor received                  
*  unauthorized assistance in completion of this assignment.         
*                                                                    
*  Signature:                                                        
*                                                                    
********************************************************************;



libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

/*question 1*/

proc contents data = math2500.hw4;
run;

proc format;
value trtgroup
	0 = "Placebo"
	1 = "Drug";
run; 

axis1 label= ('Mean Hdl') order=(0 TO 60 BY 20);
proc gchart data = math2500.hw4;
vbar trt / sumvar=hdl type=mean discrete raxis=axis1 outside=mean;
label trt = 'Treatment group';
Title 'MEAN HDL BY TREATMENT GROUP';
format trt trtgroup.;
pattern value = solid color = red;
footnote ' Homework 9. Graph 1. <Ivan Knowles>';
run;
quit;
/*question 2*/

axis1 label = ('Mean High Temperature') order = (0 to 90 by 10) minor=(number =2);
pattern1 value = solid color = black;
pattern2 value = solid color = yellow;
proc gchart data = math2500.hw3;
vbar season/sumvar = high type=mean discrete group=city patternid=group;
label temp = 'Los Angeles''San Fransisco';
Title ' Comparing seasonal high temperatures in two california cities';
footnote 'Homework 9. Graph 2. Ivan Knowles';
run;
quit;





/*question 3*/

proc contents data = math2500.hw3;
run;


proc format; 
value monthly_temp
1 = "Jan"
2 = "Feb"
3 = "Mar"
4 = "Apr"
5 = "May"
6 = "Jun"
7 = "Jul"
8 = "Aug"
9 = "Sep"
10 = "Oct"
11 = "Nov"
12 = "Dec";
run;
symbol1 i = join color=black l=1 value=square;
symbol2 i = join color=red l=2 value=dot;
axis3 minor = none; 
axis2 label = ( angle = 90 'High minus Low Temperature');
proc gplot data = math2500.hw3;
plot range*month=city/ vaxis=axis2 haxis=axis3;
Title ' Comparing Monthly Temperature Variation in LA and SF';
format month monthly_temp.;
footnote 'Homework 9. Graph 3. <Ivan Knowles>';
run;
quit;

/*question 4*/

goptions reset=all;

footnote "Homework 9, Graph 4, <Ivan Knowles>" ;

proc format;
    value t 0='Placebo' 1='Drug';
run;

proc freq data=Math2500.hw4 noprint;
    tables trt*cvd / out=test outpct;
run;


axis1 label=('%CVD') order=(0 to 25 by 5);
pattern1 v=solid color=yellow;
pattern2 v=solid color=black;
proc gchart data=test;
    where cvd=1;
    vbar trt / sumvar=pct_row discrete raxis=axis1 patternid=midpoint;
    label trt='Treatment Group';
    title 'Percent of Each Treatment Group with a History of CVD';
    format trt t.;
run;
quit;




/* question 5*/

proc contents data = math2500.cars_1993;
run; 

data cars_new;
set math2500.cars_1993;
weightround = round(weight,500);
run;
proc freq data = cars_new;
tables citympg*weightround/out = car_test;
run;

goptions reset = all;
goptions ftext = 'Helvetica' htext = 3 pct;

axis1 label = ('Car weight rounded to nearest 500') order = (1500 to 4000 by 500) minor = none;
axis2 label = ('City MPG');
proc gplot data = car_test;
Bubble citympg*weightround=count/ haxis=axis1 vaxis = axis2;
Title 'Number of Cars Each Combination of MPG and Car Weight';
Footnote ' Homework 9, Graph 5, Ivan Knowles';
run;
quit;
