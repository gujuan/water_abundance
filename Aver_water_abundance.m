function [water_aver,dwater_aver]=Aver_water_abundance()
    load('gujuan_data.mat');
    Year_count=2000:2014;
    Area_str={'Shijiu','Chaohu','10','9','8','7','Longgan','6','5','4','3','2','1','Dongdongting'};
    Season_str={'Spring','Summer','Fall','Winter'};
    water_aver=zeros(4,15,14);
    
    for b=1:4
        season_bool = strcmp(Season_str(b),Season);
        for a=1:15
            year_bool = Year_count(a) == Year;
            for c=1:14
                area_bool = strcmp(Area_str(c),Area);
                Static = WI(logical(season_bool.*year_bool.*area_bool));
                sort(Static);
                if length(Static)>=5
                    water_aver(b,a,c)=sum(Static(1:5))/5.0;
                end
            end
        end
    end
    
    dwater_aver=reshape(water_aver,60,14);
end


                    
            
        
                
            
    

            
        
        
      