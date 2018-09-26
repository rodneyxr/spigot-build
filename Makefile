###################################################
# Version
# This can be something like 1.12.2 or latest

VERSION:=1.13.1

###################################################
# Build settings
# Only edit this section if you know what you are doing

SERVER_DIR:=$(shell pwd)
BUILD_DIR:=$(SERVER_DIR)/build
BIN_DIR:=$(SERVER_DIR)/bin
JAR_NAME:=spigot-$(VERSION).jar
SPIGOT_JAR:=$(BIN_DIR)/$(JAR_NAME)

###################################################
# JVM arguments

JAVA_CMD:=$(shell which java)
MIN_RAM:=256M        # -Xms
MAX_RAM:=1024M       # -Xmx
JAVA_PARAMETERS:=-XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10

run:
	@$(SERVER_DIR)/bin/run \
		"$(JAVA_CMD)" \
		"$(MIN_RAM)" \
		"$(MAX_RAM)" \
		"$(JAVA_PARAMETERS)" \
		"$(SPIGOT_JAR)" \
		"$(SERVER_DIR)"
	@echo

build: clean
	cd $(BUILD_DIR) \
	&& java -jar $(BIN_DIR)/BuildTools.jar --rev ${VERSION}

clean:
	cd $(BUILD_DIR) \
	&& rm -rf \
        	BuildData \
        	Bukkit \
        	CraftBukkit \
        	Spigot \
        	apache-maven-* \
        	craftbukkit-*.jar \
        	spigot-*.jar \
        	*log.txt \
        	work


ifeq ($(shell test -e $(BUILD_DIR)/$(JAR_NAME) && echo -n true), true)
install: uninstall
	install $(BUILD_DIR)/${JAR_NAME} -t ${BIN_DIR}
else
install: build uninstall
	install $(BUILD_DIR)/${JAR_NAME} -t ${BIN_DIR}
endif

uninstall: 
	rm -rf $(BIN_DIR)/spigot-*.jar

.PHONY: clean build install run
