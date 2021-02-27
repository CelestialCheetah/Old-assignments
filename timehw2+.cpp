#include <iostream>

using namespace std;


int hour1;
int hour2;
int minute1;
int minute2;

int hourdifference = hour2-hour1;
int mindifference = minute2-minute1;


int main()
{

    int time1;
    int time2;

    cout << "Enter first time:"<<'\n';
    cin >> time1;


    cout << "Enter second time:"<<'\n';
    cin >> time2;


    int hour1=time1/100;
    int hour2=time2/100;
    int minute1=time1%100;
    int minute2=time2%100;

    int hourdifference = hour2-hour1;
    int mindifference = minute2-minute1;



    if(mindifference < 0)
    {
        mindifference+=60;
        mindifference--;
    }

    if(hourdifference < 0)
    {
        hourdifference+=24;
    }

    cout << "The elapsed time is " << hourdifference << " hours and " << mindifference << " minutes.\n";

    return 0;
}
