# Enzyme kinetics
## Project Summary

Lab project examining the function of alanopine dehydrogenase (ADH) in clam posterior adductor muscle and in crawfish tail muscle at 3 physiologically relevant temperatures: 15°C, 25°C, and 35°C.
## Process ##
Raw data was adjusted to include numeric temperaures and then subsets of the data by tissue type were generated.

Histograms of the data were generated to view distribution of enzyme activity between tissues.
<img src="https://github.com/CalenMendall/Enzyme_kinetics/blob/1a2e1f39e48cb415a0f1e5bdc8cf68e78357a95b/Histogram?raw=true" width="450" height="450">

Boxplots of enzyme activity across temperature for each tissue were generated to view strength of temperature effect.

<img src="https://github.com/CalenMendall/Enzyme_kinetics/blob/1a2e1f39e48cb415a0f1e5bdc8cf68e78357a95b/PAMboxplot?raw=true" width="450" height="450"> <img src="https://github.com/CalenMendall/Enzyme_kinetics/blob/1a2e1f39e48cb415a0f1e5bdc8cf68e78357a95b/Tailboxplot?raw=true" width="450" height="450">

Basic statistics and analysis of variance were then run on the data.

~~~
> summary(TissuePAM)
 Tissue.Type           I.U..gfw    
 Length:36          Min.   :10.49  
 Class :character   1st Qu.:17.58  
 Mode  :character   Median :19.44  
                    Mean   :20.15  
                    3rd Qu.:22.63  
                    Max.   :34.93  
 Tempurature            Temp          
 Length:36          Length:36         
 Class :character   Class :character  
 Mode  :character   Mode  :character  
                                     
> summary(Tissuetail)
 Tissue.Type           I.U..gfw     
 Length:36          Min.   : 1.443  
 Class :character   1st Qu.:17.733  
 Mode  :character   Median :19.681  
                    Mean   :18.887  
                    3rd Qu.:21.600  
                    Max.   :30.490  
 Tempurature            Temp          
 Length:36          Length:36         
 Class :character   Class :character  
 Mode  :character   Mode  :character 
~~~

~~~
summary(aov(I.U..gfw ~Temp, TissuePAM))
            Df Sum Sq Mean Sq F value  Pr(>F)   
Temp         2  280.8  140.38   6.903 0.00313 **
Residuals   33  671.1   20.34                   
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> summary(aov(I.U..gfw ~Temp, Tissuetail))
            Df Sum Sq Mean Sq F value Pr(>F)  
Temp         2  254.9  127.45   5.285 0.0102 *
Residuals   33  795.8   24.11                 
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> summary(aov(I.U..gfw ~Tissue.Type, EnzymeKinetics))
            Df Sum Sq Mean Sq F value Pr(>F)
Tissue.Type  1   28.7   28.69   1.003   0.32
Residuals   70 2002.5   28.61               
> summary(aov(I.U..gfw ~Temp, EnzymeKinetics))
            Df Sum Sq Mean Sq F value   Pr(>F)    
Temp         2  482.3  241.14   10.74 8.68e-05 ***
Residuals   69 1549.0   22.45                     
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 
~~~
