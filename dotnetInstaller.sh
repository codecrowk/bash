cd 

echo "Descargando dotnet"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh

echo "Instalando dotnet"
./dotnet-install.sh --version latest

echo "Agregando los alias"
echo -e $'\n'## Personal aliases >> .bashrc 
echo -e $'\n'alias dotnet="~/.dotnet/dotnet" >> .bashrc

## Actualizamos el source
source ~/.bashrc 

cd
rm dotnet-install.sh

vi .bashrc