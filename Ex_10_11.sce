//This Source file is written by Nikita Rath (18BLC1131), VIT Chennai
clear;
exec("F:\APP MAIN\Scilab\Ex_10_11_fcfs.sci")
exec("F:\APP MAIN\Scilab\Ex_10_11_sstf.sci")
exec("F:\APP MAIN\Scilab\Ex_10_11_scan.sci")
exec("F:\APP MAIN\Scilab\Ex_10_11_look.sci")
exec("F:\APP MAIN\Scilab\Ex_10_11_cscan.sci")
exec("F:\APP MAIN\Scilab\Ex_10_11_clook.sci")
clc;

//MAIN: (Given Conditions)
printf("\n Given Pendinig Request In Order :\n \t")
head = 2150
a = [2069 1212 2296 2800 544 1618 356 1523 4965 3681]
n = 10
for i = 1:n
    printf("   %4d ",a(i)) 
end

printf("\n\n  1) FCFS :\n\n")
fcfs(a,head,n)
printf("\n\n  2) SSTF :\n\n")
sstf(a,head,n)
printf("\n\n  3) SCAN :\n\n")
scan(a,head,n)
printf("\n\n  4) LOOK :\n\n")
look(a,head,n)
printf("\n\n  5) C-SCAN :\n\n")
cscan(a,head,n)
printf("\n\n  6) C-LOOK :\n\n")
clook(a,head,n)
