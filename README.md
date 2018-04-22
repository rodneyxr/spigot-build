# Spigot
Get a Spigot Minecraft server server running quickly!

## Required tools
* make
* git
* openjdk-8-jdk

## Set the version
Edit the Makefile and enter the target version to the right of `VERSION=`.
If you want the latest version, just change the version to `latest`.

**Example for version 1.12.2:**  
*Makefile*
```
1: ###################################################
2: # Version
3: # This can be something like 1.12.2 or latest
4: 
5: VERSION:=1.12.2
```

## Install
**Download the tar using `curl` or `wget`**
```
curl https://github.com/rodneyxr/spigot/releases/download/v1.0/spigot.tar.gz -o spigot.tar.gz

or

wget https://github.com/rodneyxr/spigot/releases/download/v1.0/spigot.tar.gz -O spigot.tar.gz
```

**Extract the contents**
```
tar -xvf spigot.tar.gz
```

**Change into `spigot` directory**
```
cd spigot
```

**Build and install (this can take up to 5 mintues to build)**
```
make install
```

**The first time you run the server, a EULA file will be created**
```
make run
```

**Run the server again and type `y` when prompted about the EULA. Then the server will start generating your world.**
```
make run
```

## Install (download)
```
$ curl https://github.com/rodneyxr/spigot/releases/download/v1.0/spigot.tar.gz -o spigot.tar.gz
$ tar -xvf spigot.tar.gz
$ make install
$ make run # EULA will be created
$ make run # Accept the EULA when prompted and the server will start
```

## Install (clone)
```
$ git clone https://github.com/rodneyxr/spigot
$ cd spigot
$ make install
$ make run
$ make run
```
