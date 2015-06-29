#include <Rcpp.h>
#include <algorithm>
using namespace Rcpp;

// [[Rcpp::export]]
IntegerVector recaman_Cpp(int n) {
   
   IntegerVector recaman_seq(n);
   
   recaman_seq[0]=0;
   
   for(int num=1; num<n; ++num){
     int init=recaman_seq[num-1]-num;
     
     bool already = is_false(any(recaman_seq==init));
     
     if(init>0 && already){
       recaman_seq[num]=init;
     }else{
       recaman_seq[num]=recaman_seq[num-1]+num;
     }
   }

   return recaman_seq; 
}
