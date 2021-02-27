                 *********************************************************************
*  TITLE:       Asssignmet 2                                         
*                                                                    
*  DESCRIPTION: All questions                                          
*                                                                    
*                                                                    
*------------------------------------------------------------------- 
*  JOB NAME:    Lab2.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.4                                     
*                                                                    
*  NAME:        Ivan Knowles                                      
*  DATE:        2/15/2017                                              
*------------------------------------------------------------------- 
*                                                                    
*  Honor Code Pledge:  I have neither given nor received                  
*  unauthorized assistance in completion of this assignment.         
*                                                                    
*  Signature: Ivan Knowles                                                       
*                                                                    
********************************************************************;



libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';
/*question one part one*/
proc contents data = Math2500.o_rings;
run;

proc sort data = math2500.o_rings;
by td temp flt;
run;
/* question 1 part 2*/
proc print data =math2500.o_rings noobs label;
by td;
var flt temp;
run;
/* question 1 part 3*/
proc chart data = math2500.o_rings;
vbar td/discrete;
run;
/* question 1 part 4*/
proc chart data = math2500.o_rings;
pie td/discrete;
Title ' Pie chart showeing flt with and without td';
run;

/*question 1 part 5*/
proc chart data = math2500.o_rings;
vbar td/discrete
sumvar=temp type=mean;
Title ' Vertical bar graph showing mean temp of flights';
run;

/* Question 2*/

/* question 2 part 1*/

proc contents data= math2500.candys;
run;

proc sort data = math2500.candys;
key name / ascending;
run;
/* question 2 part 1*/
proc print data= math2500.candys noobs;
var name servings carbohydrate totalfat calories;
title ' Candy sorted by name';
run;
/* question 2 part 2*/
proc sort data= math2500.candys;
by satfat;
run;
/*question 2 part 2*/
proc chart data= math2500.candys;
hbar brand
type = mean sumvar=satfat;
title ' Candy brand sorted by saturated fat values';
run;

/*question 2 part 3*/
proc plot data= math2500.candys;
plot calories*carbohydrate calories*totalfat;
title ' Candy sorted by carbs and totalfate';
run;

/*question 2 part 4*/
proc chart data = math2500.candys;
vbar fiber/discrete
type=mean sumvar=sodium;
title ' Candy sorted by amounts of sodium and fiber';
run;

/*question 2 part 5*/

proc plot data= math2500.candys;
plot sodium*fiber;
title ' A chart showing sodium and fiber values of the candy';
run;


/*question 2 part 6*/

proc print data= math2500.candys;
by vitamina;
where vitamina gt 0;
var brand name vitamina;
title ' Candy that has vitamin A values greater than zero';
run;

/*question 3*/

proc print data= math2500.pressure;
run;

proc contents data= math2500.pressure;
run;

/* question 3 part 1*/
proc contents data= math2500.pressure;
run;

proc chart data= math2500.pressure;
vbar drug/
type=mean sumvar=age;
title ' Blood pressure by drug and age';
run;

/*question 3 part 2*/
proc sort data= math2500.pressure;
by baseline_bp age;
run;

proc plot data = math2500.pressure;
plot baseline_bp*age='+';
title 'Blood pressure as people age';
run;

/*question 3 part 3*/

proc plot data = math2500.pressure;
plot baseline_bp*new_bp;
title 'Blood pressure vs new blood pressure';
run;

