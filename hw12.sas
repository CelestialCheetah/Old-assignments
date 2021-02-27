
*********************************************************************
*  TITLE:       Homework 12                                          
*                                                                    
*  DESCRIPTION: All questions                                          
*                                                                    
*                                                                    
*------------------------------------------------------------------- 
*  JOB NAME:    Lab2.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.4                                     
*                                                                    
*  NAME:        Ivan Knowles                                      
*  DATE:        04/25/2017                                              
*------------------------------------------------------------------- 
*                                                                    
*  Honor Code Pledge:  I have neither given nor received                  
*  unauthorized assistance in completion of this assignment.         
*                                                                    
*  Signature:   ivan knowles                                                     
*                                                                    
********************************************************************;





libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';



data grades;
	infile 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\Grades.dat';
	input id $ gender $ classification quiz f1 f2 comp fe;
	total = f1+f2;
run;



proc print data = grades;
title 'Problem 1';
run;


proc means data = grades;
title 'problem 2';
run;

proc ttest data = grades alpha=.05;
title ' problem 3';
run;

proc corr data = grades;
var f1 f2;
title 'problem 4 / Correlation of first and second exam';
run;
proc corr data = grades;
var total fe;
title 'problem 5';
run;

proc corr data = grades;
var gender fe;
title ' Problem 6';
run;
proc sort data = grades;
by ascending classification ;
run;
proc corr data = grades;
by classification;
var fe;                   /*COULDNT FIGURE OUT THE ISSUE*/
title 'problem 7';
run;

proc anova data = grades;
class classification;
model fe=classification;
means classification/bon;
title ' problem 8';
run;
  
proc reg data=grades;
model quiz f1 f2 comp=fe;
plot (quiz f1 f2 comp*fe);
run;

