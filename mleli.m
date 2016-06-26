function D = mleli( data, nbJobs, thinkTime, data_needed )

nbClasses = size(data,2) - 1;
nbNodes = 2;

if ~exist('nbJobs','var')
    nbJobs = zeros(1,nbClasses);
end

if ~exist('data_needed','var')
    data_needed = 0;
end

[prob_nbCustomer, nbJobs, ~] = analyseData( data, nbJobs, nbClasses, nbNodes, data_needed);

for i = 1:nbClasses
    Q(1,i)= sum(prob_nbCustomer(:,nbClasses+i).*prob_nbCustomer(:,end));
end

if ~exist('thinkTime','var')
    for i = 1:nbClasses
        thinkTime(1,i)= nbJobs(i)/mean(data{6,i})-mean(data{5,i});
    end
end

D = mleApprox( Q, nbNodes-1, nbClasses, nbJobs, thinkTime );

end

