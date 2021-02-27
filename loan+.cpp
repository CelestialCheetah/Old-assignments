#include <iostream>

using namespace std;

int month=0;
double balance=1000.0;
double rate= 0.015;
double interest;
double principle;

int main()

{

while(balance > 0)

{
    interest= balance*rate;
    principle=50 - interest;
    balance= balance - principle;
    month++;
    rate= rate+interest;


}

    cout <<"It will take"<< month << "months to pay off the loan"<<'\n';
    cout <<"The last principle payment is"<<principle<<'\n';
return 0;

}

