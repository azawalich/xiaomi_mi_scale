# on local PC
cd /home/datascience/xiaomi_mi_scale
sudo apt-get install -y qemu qemu-user-static
docker buildx build  --platform=linux/arm/v7 -t xiaomi_mi_scale:custom -f Dockerfile --no-cache .
docker save xiaomi_mi_scale:custom -o ../xiaomi_mi_scale:custom.tar
scp ../xiaomi_mi_scale:custom.tar pi@192.168.1.164:/home/pi/

# on Raspberry Pi
cd /home/pi/xiaomi_mi_scale
docker load -i /home/pi/xiaomi_mi_scale:custom.tar
docker-compose up