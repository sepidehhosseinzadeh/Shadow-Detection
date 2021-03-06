function [desc] = calcInvMean(rgb_im, seg, numRegion)
 
    im1=log(double((rgb_im(:,:,1)))./(double(rgb_im(:,:,2))) );
    im2=log(double((rgb_im(:,:,3)))./(double(rgb_im(:,:,2))) );
    vec = [1.35 1];
    vec = vec / norm(vec);
    inv_im = exp(im1*vec(1)+im2*vec(2));

    desc = zeros([numRegion, 1]);    
    ind={};
    for iReg=1:numRegion
        ind{iReg} = seg(:)==iReg;
    end
    im = inv_im;

    I = im;
    for iReg=1:numRegion
        desc(iReg) = mean(I(ind{iReg}));
    end
    
    rgb_im=rgb_im.^.45;
    inv_im=inv_im.^.45;
    %I1 = edge(rgb2gray(rgb_im), 'canny', 3);
    %I2 = edge(inv_im, 'canny', 3);
end
