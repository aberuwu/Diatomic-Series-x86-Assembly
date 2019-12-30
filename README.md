# Diatomic-Series-x86-Assembly
x86 Assembly program using the Irvine Library that calculates the first 100 values of Stern's diatomic series <br/>

Pre-Requisits: Irvine.32 Library must be installed in order to run this program<br/>

# Stern's Diatomic Series Defenition
Stern's Diatomic series is a sequence that arises within the Calkin Wilf tree in which vertices correspond one-to-one to the positive rational numbers.<br/>

The Diatomic Series is defined as follows... <br/>

p(n) = p(n/2)   <- n is an even number<br/>
p(n) = p((n-1)/2) + p(n+1)/2)  <- n is an odd number<br/>

where p(0) = 0 & p(1) = 1<br/>

![alt text](http://mathworld.wolfram.com/images/eps-gif/SternsDiatomicSeries_1000.gif)<br/>
Recurrence Equation: <br/>
![alt text](http://mathworld.wolfram.com/images/equations/SternsDiatomicSeries/NumberedEquation2.gif)<br/>
Sum Equation: <br/>
![alt text](http://mathworld.wolfram.com/images/equations/SternsDiatomicSeries/NumberedEquation3.gif)<br/>
Source: WolframMathWorld<br/>


Diatomic Series Output:  0,1,1,2,1,3,2,3,1,4,...<br/>

# High Level Implementation
In a high level language such as C++, the Diatomic Series can be calculated in a few lines of code.  This x86 implementation aims to demonstrate the usage of assembly and reflect on the complexity of how such trivial programs written in high level languages must be broken down into several smaller steps in order to achieve the same output.<br/>

Example of Stern's Diatomic Series written in C++ (Program will print out the first 100 values)...<br/>

```
int main()
{
	const int value = 99;
	int arr[value + 1];

	arr[0] = 0;
	arr[1] = 1;

	for (int i = 2; i <= value; i++) 
  {
		if (i % 2 == 0)
			arr[i] = arr[i/2];
		else
			arr[i] = arr[(i - 1) / 2] + arr[(i + 1) / 2];
	}

	for (int i = 0; i < value; i++)
	{
		std::cout << arr[i] << ",";
	}

	return 0;
}
```

