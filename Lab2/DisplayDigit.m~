% DisplayDigit: Displays the digit represented by a column vector S as an
% image. We translate vector to become nonnegative and scale to interval 
% [0,20]. The colormap is also adjusted to give "nice" images.
%
% Usage:
%   >> DisplayDigit( S );
%
%where S is a column vector of length n=256.
%

data = load('DataSet.mat')
testSet = data.TestSet;
testAns = data.TestAns;
refSet = data.RefSet;
refAns = data.RefAns;

DisplayDigits(testSet(:,1));

Subspaces = CreateSubspace(refSet, refAns, 20);
testDigit = testSet(:,6);
%ClassifyDigit(Subspaces, testDigit)
RunClassification(Subspaces, testSet, testAns)

DisplayDigits(testDigit);



function []= DisplayDigits(A)


a1=squeeze(A);  
a1=reshape(a1,16,16)';  

a1=(a1-min(min(a1))*ones(size(a1)));
a1=(20/max(max(a1)))*a1;

mymap1 =[1.0000    1.0000    1.0000
    0.8715    0.9028    0.9028
    0.7431    0.8056    0.8056
    0.6146    0.7083    0.7083
    0.4861    0.6111    0.6111
    0.3889    0.4722    0.5139
    0.2917    0.3333    0.4167
    0.1944    0.1944    0.3194
    0.0972    0.0972    0.1806
         0         0    0.0417];
colormap(mymap1)


image(a1)
end

function subspaces = CreateSubspace(refSet, refAns, k)

zeros = [;];
ones = [;];
twos = [;];
threes = [;];
fours = [;];
fives = [;];
sixes = [;];
sevens = [;];
eights = [;];
nines = [;];

for i = 1:size(refAns,2)
    if refAns(i) == 0
        zeros(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 1
        ones(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 2
        twos(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 3
        threes(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 4
        fours(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 5
        fives(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 6
        sixes(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 7
        sevens(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 8
        eights(:,end+1) = refSet(:,i);
    end
    if refAns(i) == 9
        nines(:,end+1) = refSet(:,i);
    end
end

sortedImages = {zeros, ones, twos, threes, fours, fives, sixes, sevens, eights, nines};
returnArray = {}
for i = 1:size(sortedImages,2)
    [Uj,Sj,Vj]=svd(cell2mat(sortedImages(i)));
    Ak = zeros(256,132);
    for j = 1:k
        Ak =  Uj(:,j).*Sj(j,j)*Vj(:,j)' + Ak;
    end
    returnArray{end+1} = Ak;
end
subspaces = returnArray;

end

function [] = RunClassification(Subspaces, testSet, testAns)
trueFalse = [];

for i = 1:size(testAns,2)
   testDigit = testSet(:,i);
   class = ClassifyDigit(Subspaces, testDigit);
   trueFalse(end+1) = class == testAns(i);
end

accuracy = sum(trueFalse == true, 2)/size(trueFalse,2)
end

function class = ClassifyDigit(Subspaces, S)
returnList = [;];
for i = 1:10
   currList = cell2mat(Subspaces(i));
   for j = 1:size(currList,2)
      returnList(end+1,:) = [DistanceFromTrain(currList(:,j), S) i-1];
      if size(returnList,1) == 0
         returnList(end+1,:) = [DistanceFromTrain(currList(:,j), S) i-1];
      end
   end
end    
returnList = sortrows(returnList,1);
returnList = returnList(1:20,2);

class = mode(returnList);
end


function distance = DistanceFromTrain(trainDigit, testDigit)
distance = sqrt(sum((testDigit - trainDigit) .^ 2));
end
