import Data.Char
soma x y = x+y

inc x = x+1

areaTriangulo b h = (b*h)/2

areaTrapezio a b h = (a+b)*h/2

media a b c=(a+b+c)/3

dobro a=2*a

quadriplicar a = 2*(dobro a)

mult a b c=a*b*c

hip a b=sqrt((a*a)+(b*b)) 

areaRetangulo a b = a*b

areaCirculo r = r*r*pi

quadrado a = a*a

distancia x y h j=sqrt(quadrado(x-h)+quadrado(y-j))

metade::Float ->Float
metade x = if x<10 then x/2 else x

par_ou_impar::Int ->String
par_ou_impar x = if  mod x 2==0 then "Par" else "Impar"

conceito::Float->String
conceito x = if x >= 9.0 then "A" 
 else if x>=7.5 && x<9.0 then "B" 
   else if x>=6.0 && x<7.5 then "C"
     else if x>=4 && x<6 then "D"
       else "E"


verNumero::Int->String
verNumero x = if x>=100 && x<=200 then par_ou_impar x 
else "Maior que 200 ou menor que 100"

peso_ideal::(Float,Char)->Float
peso_ideal (peso,sexo)= if sexo=='M' then (72.7*peso-58 ) else ((62.1 * peso) -44.7)

sinal::Float->Float
sinal x = if x>0 then 1 else if x<0 then (-1) else 0

conta::(Char,Float,Float)->Float
conta ('/',x,y)=x/y
conta ('*',x,y)=x*y

natacao::Int->String
natacao x =if x>= 5 &&x <= 7 then "Infantil A" 
 else if x>=8 && x<=10 then "Infantil B" 
   else if x>=11 && x<=13 then "Juvenil A"
     else if x>=14 && x<=17 then "Juvenil B"
       else "Senior"

tipo::Char->String
tipo a= if isLetter a then "letra" else if isNumber a then "numero" else "simbolo"

mediadois:: Float->Float->Float->Int
mediadois a b c=  if (a>p) && (b>p && c>p) then 3 else if  (a>p && b>p)||(a>p && c>p)|| (b>p && c>p)  then 2 else 1 where p=media a b c