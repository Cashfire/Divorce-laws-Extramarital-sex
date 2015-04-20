##Data collection: 
the data are subset from the General Social Survey (GSS) which contains the information about societal attitudes, attributes and behaviors of American society from 1972 to 2012. The Duke University modify this data for our course's use, so we basically have the tidy data in hand. The proportion of the participants from different generations should be discreetly taken into account. For example, we are more interested in rent social opinion about extramarital sex, but if 60% observations belong to 1972-2000 and most of who think the extramarital sex as always wrong, while 40% observations belong to 2002-2012 and just a few of them think so, the result may be not imply the real situation. According to the response information in appendix of the codebook, the both attitudes  really vary very much in generations, so it is more desirable to focus on "modern" times (say the decade of 2002-2012) and the study here subsets the data of 2002-2012 .


##Cases: 
there are 57061 units of observation，but the research question is more focus on the "modern" times, the analysis just uses the data of 2002-2012 (16128 observations).

##Variables:
I will study 2 variables. 
One variable is the people's attitude toward divorce laws and the column name is divlaw. "Should divorce in this country be easier or more difficult to obtain than it is now?" There are 3 options to this question ("easier", "more difficult", or "Stay the same"), so this variable is categorical.
The other variable is the people's attitude toward to extramarital sex and the column name is xmarsex. "What is your opinion about a married person having sexual relations with someone other than the marriage partner?" The answer can be "1 Always wrong", "2 Almost always wrong", "3 Sometimes wrong", "4 Not wrong at all", "5 Other"(5 levels), so this variable is also categorical and ordinal. 

This study is an observational study since the data are just collected by survey, while an experiment study must assign the explanatory variable to each subject.


##Scope of inference 
- generalizability: the population of interest is all the residences in US, and the findings from this analysis can be generalized to that population due to its random sampling method.
- causality: these data cannot be used to establish causal links because just experiments can establish causality while this study is observational study.
