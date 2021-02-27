libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

PROC GCHART DATA=math2500.fitness;
 VBAR exer;
 TITLE1 ‘PROC GCHART Example 1’;
 TITLE2 ‘No options’;
RUN;

PROC GCHART DATA=math2500.fitness;
 VBAR exer / DISCRETE RAXIS=axis1;
TITLE1 ‘PROC GCHART Example 2’;
TITLE2 HEIGHT=1.7 ‘Controlling the tick marks on the response axis’;
RUN;
QUIT; 

AXIS1 ORDER=(0 to 20 by 5) MINOR=(NUMBER=4)
LABEL=('Number of' JUSTIFY=RIGHT 'Workouts Weekly');
PROC GCHART DATA=math2500.fitness;
 VBAR exer / DISCRETE RAXIS=axis1 WIDTH=8
OUTSIDE=FREQ INSIDE=PERCENT;
TITLE1 ‘PROC GCHART Example 4’;
TITLE2 HEIGHT=1.7 'Printing statistics for each bar';
RUN;
QUIT; 


AXIS1 ORDER=(0 to 20 by 5) MINOR=(NUMBER=4)
 LABEL=(‘Number of Workouts Weekly’);
PROC GCHART DATA=math2500.fitness;
 VBAR exer / DISCRETE RAXIS=axis1;
TITLE1 ‘PROC GCHART Example 3’;
TITLE2 HEIGHT=1.7 ‘Defining more axis characteristics’;
RUN;
QUIT; 

AXIS1 ORDER=(0 to 60 by 10) MINOR=(NUMBER=4)
 LABEL=(ANGLE=90 ‘Number of Weekly Workouts’);
PATTERN1 VALUE=SOLID COLOR=VIOLET;
PATTERN2 VALUE=X3 COLOR=CYAN;
PATTERN3 VALUE=L5 COLOR=CRIMSON;
PATTERN4 VALUE=R1 COLOR=BLUE;
PROC GCHART DATA=math2500.fitness;
 VBAR sex / DISCRETE RAXIS=axis1 WIDTH=8
TYPE=SUM SUMVAR=exer SUBGROUP=teacher
PATTERNID=SUBGROUP;
TITLE1 ‘PROC GCHART Example 5’;
TITLE2 HEIGHT=1.7 ‘Changing bar patterns and colors’;
RUN;
QUIT; 


PROC GCHART DATA=math2500.fitness;
 VBAR sex / DISCRETE RAXIS=axis1
TYPE=SUM SUMVAR=exer GROUP=teacher
PATTERNID=GROUP;
TITLE1 ‘PROC GCHART Example 5d’;
TITLE2 HEIGHT=1.7 ‘Using PATTERNID=GROUP with Solid Colors’;
RUN;
QUIT;


PROC GPLOT DATA=math2500.sales;
 PLOT price*day;
 TITLE1 'PROC GPLOT Example 1a';
 TITLE2 'No Options -- Default Is a Scatter Plot';
RUN;
QUIT; 


PROC MEANS DATA=math2500.sales NOPRINT NWAY;
 VAR price cost;
 CLASS day;
 OUTPUT OUT=math2500.sumsbyday SUM=pricesum costsum;
RUN; 


PROC GPLOT DATA=sumsbyday;
 PLOT pricesum*day;
 TITLE1 'PROC GPLOT Example 1b';
 TITLE2 'Summed Data, But No Graphics Options';
RUN; 

PROC GPLOT DATA=math2500.sumsbyday;
 PLOT pricesum*day;
 TITLE1 'PROC GPLOT Example 1b';
 TITLE2 'Summed Data, But No Graphics Options';
RUN; 

SYMBOL1 I=JOIN;
PROC GPLOT DATA=math2500.sumsbyday;
 PLOT pricesum*day;
 TITLE1 'PROC GPLOT Example 2';
 TITLE2 HEIGHT=1.7 'Connect Points';
RUN; 


SYMBOL1 I=JOIN;
PROC GPLOT DATA=sumsbyday;
 PLOT costsum*day;
 TITLE1 'PROC GPLOT Example 2';
 TITLE2 HEIGHT=1.7 'Connect Points';
RUN; 


AXIS1 MINOR=(NUMBER=1) ORDER=(0 to 1400 by 200)
LABEL=('Total Sales' JUSTIFY=RIGHT '(hundreds)')
VALUE=(T=1 '$0' T=2 '$2' T=3 '$4' T=4 '$6' T=5 '$8'
 T=6 '$10' T=7 '$12' T=8 '$14');
AXIS2 LABEL=('Day of Sale in September, 2001');
SYMBOL1 I=JOIN COLOR=RED VALUE=DIAMOND HEIGHT=2;
PROC GPLOT DATA=math2500.sumsbyday;
 PLOT pricesum*day / VAXIS=axis1 HAXIS=axis2;
 TITLE1('PROC GPLOT Example 5');
 TITLE2 HEIGHT=1.7 ('Change Vertical Axis Label and Tick Mark Values');
RUN; 

AXIS1 COLOR=BLUE MINOR=(NUMBER=1)
 LABEL=('Total Sales' JUSTIFY=RIGHT '(dollars)');
AXIS2 LABEL=('Day of Sale in September, 2001');
AXIS3 COLOR=RED ORDER=(0 to 600 by 100) MINOR=(NUMBER=1)
 LABEL=('Total Cost' JUSTIFY=LEFT '(dollars)');
SYMBOL1 I=JOIN COLOR=BLUE L=1 VALUE=NONE;
SYMBOL2 I=JOIN COLOR=RED L=2 VALUE=NONE;
PROC GPLOT DATA=math2500.sumsbyday;
 PLOT pricesum*day / VAXIS=axis1 HAXIS=axis2 NOFRAME;
PLOT2 costsum*day / VAXIS=axis3;
 TITLE1 'PROC GPLOT Example 8a';
 TITLE2 HEIGHT=1.5 'Display Both Left and Right Vertical Axes';
 TITLE4 'This plot is deceptive! The store appears to apply a very
small markup.';
 FORMAT pricesum costsum dollar8.;
RUN; 


PROC MEANS DATA=math2500.cars_1993 NWAY;
 VAR citympg;
 CLASS type;
 OUTPUT OUT=mpgmeans N=count MEAN=meanmpg;
RUN;
GOPTIONS RESET=all;
GOPTIONS FTEXT='Helvetica' HTEXT=3 pct;
AXIS1 OFFSET=(4);
AXIS2 OFFSET=(2) ORDER=(16 to 30 by 2) MINOR=(NUMBER=1);
PROC GPLOT DATA=mpgmeans;
 BUBBLE meanmpg*type=count / HAXIS=axis1 VAXIS=axis2;
 LABEL meanmpg='Mean MPG'
 type='Car Type';
 TITLE1 HEIGHT=4 pct'PROC GPLOT Example 11';
 TITLE3 HEIGHT=3.5 pct 'Bubble Plot';
RUN; QUIT; 
