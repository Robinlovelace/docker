# source: https://github.com/paleolimbot/qgisprocess/blob/master/.github/workflows/R-CMD-check.yaml
wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import || true
chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
add-apt-repository "deb https://qgis.org/ubuntu `lsb_release -c -s` main"
apt-get update
apt-get install -y qgis qgis-plugin-grass saga