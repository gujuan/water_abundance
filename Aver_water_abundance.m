function [water_aver,dwater_aver]=Aver_water_abundance()
    [x,y,total]=xlsread('??????????????');
    %[a,b]=size(total);
    fs={'year';'area';'date';'season';'abundance'};
    water_struct=cell2struct(total,fs,2);
    Year=(2000:2014);
    Area={'????';'????';'10';'9';'8';'7';'????';'6,';'5';'4';'3';'2';'1';'??????'};
    Season={'??';'??';'??';'??'};
    water_aver=zeros(4,15,14);


    [n,m]=size(water_struct);
    x=1;y=1;
    Static=ones(4*15*14,100);
    index=1;

    for b=1:4
        for a=2000:2014
            for c=1:14
                for i=1:n
                    j=1;
                    if(water_struct(i).year==a&strcmp(water_struct(i).area,Area(c))&strcmp(water_struct(i).season,Season(b)))
                        Static(index,j)=water_struct(i).abundance;
                        j=j+1;
                    end
                end
                sort(Static(index,:));
                water_aver(b,a-1999,c)=( Static(index,1)+ Static(index,2)+ Static(index,3)+ Static(index,4)+Static(index,5))/5.0;
                index=index+1;
            end
        end
    end
    
    dwater_aver=reshape(water_aver,60,14);
end


                    
            
        
                
            
    

            
        
        
      