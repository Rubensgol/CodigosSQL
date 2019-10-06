def funcas(coeficientes):
    c=[]
    c=coeficientes.split()
    return c
def funcb(coeficientes,vli):
    a=funcas(coeficientes)
    b=[]
    b.append(float(a[0]))
    for i in range(1,len(a)):
        x=float(a[i])+(vli*float(b[i-1]))
        b.append(x)
    return b
def funcc(coeficientes,vli):
    b=funcb(coeficientes,vli)
    c=[]
    c.append(b[0])
    for i in range(1,len(b)-1):
        x=b[i]+(vli*c[i-1])
        c.append(x)
    return c
def resoluc(coeficientes):
    x=0.5
    xa=0
    erro=1
    v=0
    while(erro>0.05 or v==200):
        xa=x
        fb=funcb(coeficientes,x)
        fc=funcc(coeficientes,x)
        x=x-(fb[-1]/fc[-1])
        erro=abs(xa-x)
        v=v+1
    return x


a =input("Digite os coeficientes")
print(resoluc(a))