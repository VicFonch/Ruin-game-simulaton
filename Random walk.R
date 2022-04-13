
#Simulacion del problema de la ruina para dos jugadores A y B de capital a y b respectivamente 
#con probabilidad p de ganar un intento el jugador B y (1 - p) el jugador A

player.ruin = function(a, b, p, plot = TRUE){
  cont.a = a
  cont.b = b
  s.n = a
  
  i = 1
  while (cont.a != 0 && cont.b != 0) {
    x = 2*rbinom(n = 1, size = 1, prob = p) - 1
    if(x == 1){
      cont.a = cont.a - 1
      cont.b = cont.b + 1
    }else{
      cont.a = cont.a + 1
      cont.b = cont.b - 1
    }
    s.n = c(s.n, s.n[i] + x)
    i = i + 1
  }
  
  if(plot){
    Sn = ts(s.n)
    plot(ggplot2::autoplot(Sn))
  }
  
  if(cont.a == 0){
    ganador = "B"
  }else{
    ganador = "A"
  } 
  
  return(invisible(list(Sn = s.n, ganador = ganador)))
}


############################### INSISO a)
#Calculo aproximado de p.b: La probabilidad de que B arruine a A para p = 1/2  

bin = NULL
for (i in 1:1000) {
  x = player.ruin(10, 10, p = 0.5, plot = FALSE)$ganador  
  if(x == "A"){
    bin = c(bin, 0)
  }else bin = c(bin, 1)
}
p.b = mean(bin)
p.b

#Calculo aproximado de m.b: Tiempo esperado en el que B arruina a A para p = 1/2

esp = NULL
for (i in 1:1000) {
  esp = c(esp, length(player.ruin(10, 10, p = 0.5, plot = FALSE)$Sn)) 
}
m.b = mean(esp)
m.b

#Calculo aproximado de p.b: La probabilidad de que B arruine a A para p = 0.1  

bin = NULL
for (i in 1:1000) {
  x = player.ruin(10, 10, p = 0.1, plot = FALSE)$ganador  
  if(x == "A"){
    bin = c(bin, 0)
  }else bin = c(bin, 1)
}
p.b = mean(bin)
p.b

#Calculo aproximado de m.b: Tiempo esperado en el que B arruina a A para p = 0.1

esp = NULL
for (i in 1:1000) {
  esp = c(esp, length(player.ruin(10, 10, p = 0.1, plot = FALSE)$Sn)) 
}
m.b = mean(esp)
m.b

