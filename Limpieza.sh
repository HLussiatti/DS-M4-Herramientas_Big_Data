#Detengo todos los contenedores
sudo docker stop $(sudo docker ps -a -q)
#Elimino todos los contenedores
sudo docker container prune -f
#Elimino las imágenes
sudo docker volume prune
#Elimino todas las imágenes
sudo docker rmi -f $(sudo docker images -q)
#Verifico espacio
lf -lh