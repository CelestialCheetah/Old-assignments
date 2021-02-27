libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';


PROC  CHART  DATA=Math2500.sales; VBAR clerk;
TITLE   'Chart of a  Character Variable'; RUN;

PROC  CHART  DATA=Math2500.sales; HBAR price;
TITLE1   "Chart of a  Continuous Variable";
RUN;

PROC  CHART  DATA=Math2500.sales  ; VBAR dept / TYPE=PCT ;
VBAR dept / TYPE=SUM  SUMVAR=price  ;
TITLE1   "PROC CHART: Using TYPE & SUMVAR  Options" ; RUN  ;

OPTIONS NOCENTER;
PROC  CHART  DATA=Math2500.sales  ; 
HBAR day  ;
HBAR day  / DISCRETE ; 
VBAR weekday   ;
VBAR weekday   / MIDPOINTS='MON'  'TUE' 'WED'   'THR' 'FRI'  'SAT' ; 
TITLE1   "PROC CHART: Using DISCRETE & MIDPOINTS Options" ;
RUN;

PROC  CHART  DATA=Math2500.sales  ;
HBAR price / GROUP=dept NOSTATS  ; VBAR clerk / SUBGROUP=dept ;
TITLE1   "PROC CHART: USING GROUP  & SUBGROUP  Options" ; RUN;

PROC  PLOT DATA=Math2500.sales  ; 
PLOT price*day cost*price  ;
PLOT cost*price='+' / VPOS=40 HPOS=40 ;
TITLE1   "Scatter Plot of Data   from Sales Data   Set" ; RUN;


PROC  PLOT DATA=Math2500.sales  ; PLOT cost*price=dept ;
LABEL cost =  'Wholesale Cost' price= 'Retail  Price' ;
TITLE1   "Using the Values of  a  Third Variable as  Plotting Symbols"  ; RUN;

OPTIONS LINESIZE=79  PAGESIZE=41 NODATE  NONUMBER; PROC  FREQ DATA=Math2500.sales;
TABLES dept clerk  dept*clerk;
TITLE1   "Frequency Distributions and  Crosstabulations"; RUN;

PROC  FREQ DATA=Math2500.sales;
TABLES dept*clerk / NOROW  NOCOL   NOPERCENT; TITLE1   "Table with  Percents Suppressed";
RUN;

PROC  SORT DATA=Math2500.sales2  OUT=sales;
 	BY sex;
 	RUN;







