# Install openshot
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt install openshot-qt python3-openshot -y
mkdir -p ~/.openshot_qt/yolo/
wget -c https://github.com/RPTST/MTS/blob/main/src/yolov3.cfg -O ~/.openshot_qt/yolo/yolov3.cfg
wget -c https://pjreddie.com/media/files/yolov3.weights -O ~/.openshot_qt/yolo/yolov3.weights
wget -c https://github.com/RPTST/MTS/blob/main/src/coco.names -O ~/.openshot_qt/yolo/obj.names
