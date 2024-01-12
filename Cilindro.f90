program arithmetic
  implicit none

  real :: pi
  real :: diametro
  real :: height
  real :: area
  real :: volume
  real :: radius

  pi = 3.141592654

  print *, 'Informe o diâmetro da base do cilindro:'
  read(*,*) diametro

  print *, 'Informe a altura do cilindro:'
  read(*,*) height

  radius = diametro / 2
  area = pi * radius**2
  volume = area * height
  
  write (*,*) "----------------------------"

  print *, 'Raio do cilindro: ', radius
  print *, 'Altura: ', height
  print *, 'Área da base: ', area
  print *, 'Volume: ', volume

end program arithmetic