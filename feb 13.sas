libname math2500 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

OPTIONS LINESIZE=90  PAGESIZE=30 NODATE  NONUMBER; PROC  SORT DATA=weight_club;
BY team; RUN;
proc contents data = weight_club;
run;
PROC  MEANS  DATA=weight_club; BY team;
WHERE  loss >  10;
VAR startweight endweight loss; LABEL loss =  ‘Weight Lost’; TITLE   ‘Weight Loss   by  Team’; TITLE2   ‘Spring 2001’;
FOOTNOTE  ‘Only including  members  who  lost more  than 10  pounds’; RUN;


PROC  SORT DATA=Math2500.sales  OUT=sales ; BY dept DESCENDING  clerk ;
RUN;


PROC  PRINT  DATA=sales  NOOBS  ;
TITLE   'Sorting a  SAS Data   Set' ; RUN;

OPTIONS NODATE  NONUMBER;
PROC  SORT DATA=Math2500.sales  OUT=sales; BY dept clerk;
RUN;
proc contents data=math2500.sales;
run;
PROC  PRINT  DATA=sales(OBS=25)  LABEL; BY dept clerk;
WHERE  price >  60; VAR price cost; 
SUM  price cost; 
SUMBY  dept;
LABEL cost='Cost of Item' price='Price of Item';
TITLE1   'Partial  Listing of Sales Data   Set'; TITLE2   'Using  Selected Options and  Statements';
RUN;


libname mylib 'C:\Users\Sr. Ivan the Baron\Desktop\Math2500\SAS data';

OPTIONS LINESIZE=90  PAGESIZE=30 NODATE  NONUMBER; PROC  SORT DATA=weight_club;
BY team; RUN;
PROC  MEANS  DATA=weight_club; BY team;
WHERE  loss >  10;
VAR startweight endweight loss; LABEL loss =  ‘Weight Lost’; TITLE   ‘Weight Loss   by  Team’; TITLE2   ‘Spring 2001’;
FOOTNOTE  ‘Only including  members  who  lost more  than 10  pounds’; RUN;
