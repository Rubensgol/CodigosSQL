def retangulos(x,xn,n):
    h=(xn-x)/n
    xn=(x+x+h)/2
    soma=0
    for i in range(0,n):
        fx=(xn)/(1+xn*xn)
        soma=soma+fx
        xn=xn+h
    r=h*soma
    return r

def trapezio(x,xn,n):
    h=(xn-x)/n
    soma=0
    for i in range(0,n):
        fx=(x)/(1+x*x)
        if i==0 or i==n:
            soma=soma+fx
        else:
            soma=soma+2*fx
        x=x+h
    r=(h/2)*soma
    return r

def simpisons(x,xn,n):
    h=(xn-x)/n
    soma=0
    for i in range(0,n):
        fx=(x)/(1+x*x)
        if i==0 or i==n:
            soma=soma+fx
        else:
            if i%2==0 :
                soma=soma+2*fx
            else:
                soma=soma+4*fx
        x=x+h
    r=(h/3)*soma   
    return r

print(trapezio(0,1,100))