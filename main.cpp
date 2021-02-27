#include <iostream>
#include <vector>
#include <cstdlib>
using namespace std;

int main(){

char response = 'y';
vector<bool> isPrime(2001);
bool numIsPrime;
    for (int i = 2; i < 2001; i++) {
        numIsPrime = true;
            for (int j = 2; j < i; j++) {
                if ( i % j == 0) {
                    numIsPrime = false;
                break;
                }
        }
    if (numIsPrime){
        isPrime.at(i) = true;
    }
    else{
        isPrime.at(i) =false;
    }
}
    while (response == 'y'){
        while(1) {
            int k = 2 + rand() % (2000 - 2 + 1);
            if(isPrime.at(k)){
                cout << k << "\n";
         break;

            }
    }

    cout<< "Do you wish to continue? (y/n)";
    cin >>response;
}
        system("Pause");
    return 0;
}
