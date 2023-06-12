echo "***FIXING BROKEN FILES, REMOVING UNNECESSARY PACKAGES AND THEIR DEPENDENCIES***"
sudo apt -f install
sudo apt-get update
sudo apt-get upgrade -y
sudo apt purge --autoremove && sudo apt autoclean 
echo "***CLEANING CACHE***"
cd /var/cache/apt
echo "***CACHE BEFORE CLEANUP:***"
sudo du -sh .
sudo apt-get clean
echo "***CACHE AFTER CLEANUP***"
sudo du -sh .
cd ~
echo "***CLEANING LOG FILES***"
echo "***LOG FILES BEFORE CLEANUP:***"
sudo journalctl --disk-usage 
sudo journalctl --rotate
sudo journalctl --vacuum-time 1d
echo "***LOG FILES AFTER CLEANUP***"
sudo journalctl --disk-usage 

sudo snap set system refresh.retain=2

echo "***CLEANING THUMBNAILS***"
echo "BEFORE"
du -sh .cache/thumbnails/
sudo rm -rf ~/.cache/thumbnails/*
echo "AFTER"
du -sh .cache/thumbnails/	
