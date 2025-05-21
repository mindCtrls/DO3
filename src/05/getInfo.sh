getInformation() {

count_dir=$(find $1 -mindepth 1 -type d | wc -l)
list_dir_most_large=$(du -h $1 | sort -hr | head -6 | awk 'NR>1 {printf "%d - %s, %s\n", NR-1, $2, $1}')
count_file=$(find $1 -type f | wc -l)
count_file_conf=$(find $1 -type f -name "*.conf" | wc -l)
count_file_text=$(find $1 -type f \( -name "*.txt" -o -name "*.html" -o -name "*.htm" -o -name "*.doc" -o -name "*.docx" \) | wc -l )
count_file_exe=$(find $1 -type f -executable | wc -l)
count_file_log=$(find $1 -type f -name "*.log" | wc -l)
count_file_arch=$(find $1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.7z" -o -name "*.rar" \) | wc -l)
count_file_links_soft=$(find $1 -type l | wc -l)
top_file_most_large=$(find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk 'BEGIN {i=1} {
        split($2, parts, ".");
        ext=parts[length(parts)] == $2 ? " - " : parts[length(parts)];
        printf "%d - %s, %s, %s\n", i++, $2, $1, ext
}')
top_file_executable_most_large=$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk 'BEGIN {i=1} {
        cmd = "sha256sum \"" $2 "\" 2>/dev/null"
        cmd | getline sha_full
        close(cmd)
        split(sha_full, sha_arr, " ")
        printf "%d - %s, %s, %s\n", i++, $2, $1, sha_arr[1]
}')

end_time=$(date +%s)
time_execution=$((end_time-$2))

cat <<EOF
Total number of folders (including all nested ones) = $count_dir
TOP 5 folders of maximum size arranged in descending order (path and size):
$list_dir_most_large
Total number of files = $count_file
Number of:
Configuration files (with the .conf extension) = $count_file_conf
Text files = $count_file_text
Executable files = $count_file_exe
Log files (with the extension .log) = $count_file_log
Archive files = $count_file_arch
Symbolic links = $count_file_links_soft
TOP 10 files of maximum size arranged in descending order (path, size and type):
$top_file_most_large
TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):
$top_file_executable_most_large
Script execution time (in seconds) = $time_execution
EOF
}

