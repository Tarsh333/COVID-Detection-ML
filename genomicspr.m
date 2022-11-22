x = textread('D:\Devsupport\covid_data\sequence(19).fasta','%s');

ans=[];


a = char(x);
[r2 c2] = size(a);
c = [];
for k = 1:r2 
for m = 1:c2 
c = [c a(k,m)];

end
end
newStr = c(2:end);
t=deblank(newStr);
p=basecount(t);
A=p.A;
G=p.G;
C=p.C;
T=p.T;
TOTAL=A+G+C+T;
[Dimers, Percent] = dimercount(t);




features = segmentation_and_fft(t);

 ans=[ans,A*100/TOTAL,G*100/TOTAL,C*100/TOTAL,T*100/TOTAL,Percent(13)*100,Percent(10)*100,features];

 

disp(ans) ; 
