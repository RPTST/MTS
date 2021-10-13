# Install openshot
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt install openshot-qt python3-openshot -y
mkdir -p ~/.openshot_qt/yolo/
wget -c https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov3.cfg -O ~/.openshot_qt/yolo/yolov3.cfg
wget -c https://pjreddie.com/media/files/yolov3.weights -O ~/.openshot_qt/yolo/yolov3.weights
wget -c https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names -O ~/.openshot_qt/yolo/obj.names
