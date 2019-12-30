# Diatomic-Series-x86-Assembly
x86 Assembly program using the Irvine Library that calculates the first 100 values of Stern's diatomic series <br/>

# Stern's Diatomic Series Defenition
Stern's Diatomic series is a sequence that arises within the Calkin Wilf tree in which vertices correspond one-to-one to the positive rational numbers.<br/>

The Diatomic Series is defined as follows... <br/>

p(n) = p(n/2)   <- n is an even number<br/>
p(n) = p((n-1)/2) + p(n+1)/2)  <- n is an odd number<br/>

where p(0) = 0 & p(1) = 1<br/>

![alt text](http://mathworld.wolfram.com/images/eps-gif/SternsDiatomicSeries_1000.gif)<br/>
Source: WolframMathWorld


Diatomic Series Output:  0,1,1,2,1,3,2,3,1,4,...<br/>

