*********************************************************************
*  TITLE:       Homework 10                                          
*                                                                    
*  DESCRIPTION: All questions                                          
*                                                                    
*                                                                    
*------------------------------------------------------------------- 
*  JOB NAME:    Lab2.SAS                                             
*  LANGUAGE:    SAS, VERSION 9.4                                     
*                                                                    
*  NAME:        Ivan Knowles                                      
*  DATE:        04/07/2017                                              
*------------------------------------------------------------------- 
*                                                                    
*  Honor Code Pledge:  I have neither given nor received                  
*  unauthorized assistance in completion of this assignment.         
*                                                                    
*  Signature:                                                        
*                                                                    
********************************************************************;




data weight;
input before after @@;
b = before*2.2;
a = after*2.2;
datalines;
55.7  61.7
54.9  58.8
59.6  66.0
62.3  66.2
74.2  79.0
75.6  82.3
70.7  74.3
53.3  59.3
73.3  79.1
63.4  66.0
68.1  73.4
73.7  76.9
91.7  93.1
55.9  63.0
61.7  68.2
57.8  60.3
;
run;

proc ttest data = weight h0=16 alpha=.05;
title 'Problem 1';
paired after*before;
run;

/*Problem 2*/
data prices ;
input bedroom_3 $ bedroom_4;
datalines;
3b	79500
3b	82000
3b	89999
3b	90000
3b	99900
3b	100000
3b	106900
3b	113900
3b	115000
3b	117500
3b	122900
3b	129900
3b	139900
3b	145000
3b	149000
3b	150000
3b	157900
3b	164900
3b	189900
3b	219900
3b	260000
3b	274900
3b	295000
4b	149900
4b	169900
4b	175000
4b	189000
4b	206900
4b	225000
4b	249900
4b	289900
4b	320000
4b	339900
4b	399900
4b	429900
4b	320000
4b	269900
;
run;
 
proc ttest data = prices alpha=.01;
class bedroom_3;
var bedroom_4;
run;
