# a script to remove downloaded data older than 1 hour

import os
import time

# get the current time
current_time = time.time()

download_dir = '/downloads'

# loop through the files in the download directory, including subdirectories
old_files = []
for file in os.listdir(download_dir):
    # get the full path of the file
    file_path = os.path.join(download_dir, file)
    # get the time the file was last modified
    file_time = os.path.getmtime(file_path)
    # check if the file is older than 1 hour
    if current_time - file_time > 3600:
        old_files.append(file_path)

print(f"Found {len(old_files)} files to remove")
for file in old_files:
    os.remove(file)
    print(f"Removed {file}")