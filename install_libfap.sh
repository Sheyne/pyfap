wget http://pakettiradio.net/downloads/libfap/1.3/libfap-1.3.tar.gz
tar xzf libfap-1.3.tar.gz
cd libfap-1.3

./configure
make

while true; do
    read -p "Do you wish to install this program? (y/n/[s]udo)" yn
    case $yn in
        [Ss]* ) sudo make install; break;;
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

