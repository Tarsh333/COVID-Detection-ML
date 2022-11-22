function features = segmentation_and_fft(x)
c=char(x);       
spectrum = [];
spectrumTwo = [];
eiip = [];
for i=1:length(c)
    if (c(i)=='A') || (c(i)=='a')
        eiip=[eiip,0.1260];
    elseif (c(i)=='C') || (c(i)=='c')
        eiip=[eiip,0.1340];
    elseif (c(i)=='T') || (c(i)=='t')
        eiip=[eiip,0.1335];
    else 
        eiip=[eiip,0.0806];
    end
end
Feiip = fft(eiip);
 for i=1:length(c)
     specTotal = (abs(Feiip(i))^2);
     specTwo = (abs(Feiip(i)));
     spectrum=[spectrum,specTotal];
     spectrumTwo=[spectrumTwo,specTwo];
 end
spectrum=10*log10(spectrum);
features = [];
average = sum((spectrum))/length(spectrum);
features=[features,average];
%medians = median(spectrum,'all');
%features=[features,medians];
maximum = max((spectrum));
features=[features,maximum];
minimum = min((spectrum));
features=[features,minimum];
peak = (length(spectrum)/3)/(average);
features=[features,peak];
%peak_two = (length(spectrumTwo)/3)/(mean(spectrumTwo,'all'));
%features=[features,peak_two];
stddev = std((spectrum));
features=[features,stddev];
percentile15 = prctile(spectrum, 15);
features=[features,percentile15];
percentile25 = prctile(spectrum, 25);
features=[features,percentile25];
percentile50 = prctile(spectrum, 50);
features=[features,percentile50];
percentile75 = prctile(spectrum, 75);
features=[features,percentile75];
amplitude = maximum - minimum;
features=[features,amplitude];
variance = var((spectrum));
features=[features,variance];
interquartile_range =(prctile(spectrum, 75)) - (prctile(spectrum, 25));
features=[features,interquartile_range];
semi_interquartile_range = ((prctile(spectrum, 75)) - (prctile(spectrum, 25)))/2;
features = [features, semi_interquartile_range];
coefficient_of_variation = stddev/average;
features=[features, coefficient_of_variation];
kurtosis = ((prctile(spectrum, 75)) - (prctile(spectrum, 25))) / (2 * ((prctile(spectrum, 90)) - (prctile(spectrum, 10))));
features=[features, kurtosis];
fre = 1:length(spectrum);
end