// MineSweeperAsm.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <string>
#include <chrono>  

using namespace std;
int arr[1000];

extern "C" void putBomb(int x, int y, int n, int* arr);
extern "C" int calculateBomb(int i, int n, int mn,int* arr);

int main()
{
	int m, n, k, x, y;
	cin >> m >> n >> k;

	for (int i = 0; i < m*n; i++)
		arr[i] = 0;

	for (int i = 0; i < k; i++) {
		cin >> x;
		cin >> y;

		putBomb(x, y, n, arr);
		
		/*
		__asm
		{
			//mul instruction multiplies eax and edx values 
			//and stores the result like edx:eax
			//mul edx -> edx*eax 
			mov eax, x
			mov edx, n
			mul edx
			add eax, y//eax = x*n+y
			mov ebx,OFFSET arr
			add ebx,eax
			mov [ebx],'*'
		}*/
	}
	
	auto start = std::chrono::high_resolution_clock::now();
	for (int i = 0; i < m*n; i++)
	{
		calculateBomb(i, n, m*n, arr);
	}
	auto finish = std::chrono::high_resolution_clock::now();
	std::chrono::duration<double> elapsed = finish - start;
	

	//calculating number of each cell
	
	/*
	for (int i = 0; i < m*n; i++)
	{
		int count = 0, mn = m * n;
		if (arr[i] != 13)
		{
			int count = 0;
			//agar dar sutun avval bashad HAMMEYE CHAP DAR HA hesab nemishavand
			//agar dar sutun axar bashad HAMMEYE RAST DAR HA hesab nemishavand
			if (i%n == 0)//avval
			{
				if (i - n >= 0 && arr[i - n] == 13)//up
					count++;
				if (i - n + 1  >= 0 && arr[i - n + 1] == 13)//up right
					count++;
				if (i + 1 < m*n  && arr[i + 1] == 13)//right
					count++;
				if (i + n < m*n    && arr[i + n] == 13)//down
					count++;
				if (i + n + 1 < m*n  && arr[i + n + 1] == 13)//down right
					count++;
			}
			else if (i%n == n - 1)//axar
			{
				if (i - n >= 1 && arr[i - n - 1] == 13)//up left
					count++;
				if (i - n >= 0 && arr[i - n] == 13)//up
					count++;
				if (i >= 1 && arr[i - 1] == 13)//left
					count++;
				if (i + n - 1 < m*n  && arr[i + n - 1] == 13)//down left
					count++;
				if (i + n < m*n    && arr[i + n] == 13)//down
					count++;
			}
			else
			{
				if (i - n >= 1 && arr[i - n - 1] == 13)//up left
					count++;
				if (i - n >= 0 && arr[i - n] == 13)//up
					count++;
				if (i - n + 1 >= 0 && arr[i - n + 1] == 13)//up right
					count++;
				if (i >= 1 && arr[i - 1] == 13)//left
					count++;
				if (i + 1 < m*n  && arr[i + 1] == 13)//right
					count++;
				if (i + n - 1 < m*n  && arr[i + n - 1] == 13)//down left
					count++;
				if (i + n < m*n    && arr[i + n] == 13)//down
					count++;
				if (i + n + 1 < m*n  && arr[i + n + 1] == 13)//down right
					count++;
			}
			arr[i] = count ;//casting int to char
		}
	}
	*/


	cout << elapsed.count() << endl;

	//printing table
	for (int i = 0; i < m*n; i++) {
		cout << arr[i]<<"\t";
		if(i%n==n-1)
			cout << endl;
	}
	
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file