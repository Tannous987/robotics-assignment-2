#!/bin/bash

#2. Advanced Directory and File Management
echo "2.1 Advanced Directory and File Management"
echo "Creating workspace/{docs,logs,data,scripts} folders"
mkdir -p workspace/{docs,logs,data,scripts} 

echo "2.2 creating initial setup files using touch."
touch workspace/docs/README.md workspace/logs/system.log workspace/data/input.csv workspace/scripts/setup.sh

#3. File Creation and Manipulation
echo "3. File Creation and Manipulation"
#3.1 Create files in the docs folder using touch
echo "3.1 Creating files in docs using touch"
touch workspace/docs/{file1.txt,file2.txt,file3.txt,welcome.txt}

#3.2Add some initial content to the files
echo "3.2 Adding content to docs files..."
echo -e "1-Hello world from file 1.\n2\n3\n4\n5\n6\n7\n8\n9" > workspace/docs/file1.txt
echo "Hello world from file 2." > workspace/docs/file2.txt
echo "Hello world from file 3." > workspace/docs/file3.txt
echo "Welcome to the robotics-assignment-2!" > workspace/docs/welcome.txt

#3.3 Merge file 1, 2, 3 into one using cat and redirect the output to summary.txt.
echo "3.3 Merge file 1, 2, 3 into one using cat and redirect the output to summary.txt."
cat workspace/docs/file1.txt workspace/docs/file2.txt workspace/docs/file3.txt > workspace/docs/summary.txt

#3.4 Display the beginning of summary.txt with head and the end with tail.
echo "3.4.1 Display the beginning of summary.txt with head."
head workspace/docs/summary.txt
echo "3.4.2 Display the end of summary.txt with tail."
tail workspace/docs/summary.txt

#3.5 Use grep to find 'file' string in summary.txt and redirect these findings to logs/search_results.txt.
echo "3.5 Use grep to find 'file' string in summary.txt and redirect these findings to logs/search_results.txt."
grep "file" workspace/docs/summary.txt > workspace/logs/search_results.txt

#3.6 Move file1.txt from docs to data and copy file2.txt to logs
echo "3.6 Move file1.txt from docs to data and copy file2.txt to logs"
mv workspace/docs/file1.txt workspace/data
cp workspace/docs/file2.txt workspace/logs

# 4. File Permissions and Ownership
echo "4. File Permissions and Ownership"
echo "4.1 Adjust permissions of scripts to allow only the user execution rights."
chmod -R 766 workspace/scripts
ls -l workspace
echo "4.2 Change ownership of data to the Iyad987 user and robotics987 group."
# Check if the group 'robotics987' exists, and create it if it doesn't
if ! grep -q "^robotics987:" /etc/group; then
    echo "Creating group robotics987"
    sudo groupadd robotics987
else
    echo "Group robotics987 already exists."
fi

# Check if the user 'Iyad987' exists, and create it if it doesn't
if ! id -u "Iyad987" &>/dev/null; then
    echo "Creating user Iyad987"
    sudo useradd Iyad987 -g robotics987
else
    echo "User Iyad987 already exists."
fi

# Change ownership of the 'workspace/data' directory to Iyad987:robotics987
echo "Changing ownership of workspace/data to Iyad987:robotics987"
sudo chown Iyad987:robotics987 workspace/data
ls -l workspace

#5. System Monitoring and Basic Networking
echo "5. System Monitoring and Basic Networking"
echo "5.1 Creating system-monitoring and basic-networking folders in the current folder"
mkdir system-monitoring basic-networking

echo "5.2 Capture the disk space information in the disk_space.txt file located inside the system monitoring folder."
df -h > system-monitoring/disk_space.txt

echo "5.3 Capture the total size of the current folder in the directory_size.txt file located inside the system-monitoring folder."
du -sh . > system-monitoring/directory_size.txt

echo "5.4 Capture the network configurations in the network-config.txt file located inside the basic-networking folder."
ifconfig > basic-networking/network-config.txt

echo "5.5 Capture the internet connectivity status to google.com in the ping-test.txt file located inside the basic-networking folder."
ping -c 4 google.com > basic-networking/ping-test.txt 
#The -c flag followed by the number 4 is used to send only 4 packets to google.com,
#automatically stopping the ping command after those packets,
#instead of requiring the user to press Ctrl+C.
                                          
echo "Setup complete! The robotics-assignment-2 structure has been created and files are set up."













