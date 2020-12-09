﻿:- use_module(library(pio)). 
:- set_prolog_flag(double_quotes, codes). 
:- encoding(utf8). 
s -->         { writeln('Начало Разбора'), write('[') } ,cs, ['.'], { writeln(']\nКонец Разбора') }. 
cs -->        sentence, [','], союз, sentence. 
cs -->        sentence, [','], союз, sentence, list. 
list -->      [','], союз, sentence, list. 
list --> !. 
sentence -->  onepart. 
sentence -->  twopart. 
onepart -->   сказуемое, { write('= сказуемое,') }. 
onepart -->   подлежащее, { write('= подлежащее,') }. 
twopart -->    сказуемое, { write('= сказуемое,') }, подлежащее, { write('= подлежащее,') }. 
twopart -->   подлежащее, { write('= подлежащее,') },  сказуемое, { write('= сказуемое,') }. 

 

союз -->     unionAnd. 
союз -->     unionBut. 
союз -->     unionCondition. 
союз -->     podchinCondition. 
 unionAnd --> [и]. 
unionAnd --> [да]. 
unionBut --> [да]. 
unionBut --> [а]. 
unionBut --> [но]. 
unionBut --> [зато]. 
unionBut --> [однако]. 
unionBut --> [чтобы]. 
unionCondition --> [или]. 

unionCondition --> [либо]. 

podchinCondition --> [когда].
подлежащее --> местоимение, { write('Местоимение ') }. 
подлежащее --> существительное, { write('Существительное ') }. 
местоимение -->[я]. 
местоимение -->[ты]. 
местоимение -->[он]. 
% местоимение(3,единственное) -->[она]. 
% местоимение(3,единственное) -->[оно]. 
местоимение -->[мы]. 
местоимение -->[вы]. 

местоимение -->[они]. 
сказуемое --> глагол, { write('Глагол ') }. 
глагол -->  [пишу]. 
глагол -->  [пишешь]. 
глагол -->  [пишет]. 
глагол --> [пишем]. 
глагол --> [пишете]. 
глагол --> [пишут]. 
существительное --> [друг].
