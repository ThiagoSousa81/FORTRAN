program bhaskara

    implicit none
    
    real :: a, b, c, delta, x1, x2
    
    write(*,*) "Digite o valor de a:"
    read(*,*) a
    
    write(*,*) "Digite o valor de b:"
    read(*,*) b
    
    write(*,*) "Digite o valor de c:"
    read(*,*) c
    
    delta = b**2 - 4*a*c
    
    if (delta < 0) then
        write(*,*) "Não existem raízes reais."
    else if (delta == 0) then
        x1 = (-b + sqrt(delta)) / (2*a)
        write(*,*) "Existe apenas uma raiz real: ", x1
    else
        x1 = (-b + sqrt(delta)) / (2*a)
        x2 = (-b - sqrt(delta)) / (2*a)
        write(*,*) "As raízes reais são: ", x1, " e ", x2
    endif
    
end program bhaskara
