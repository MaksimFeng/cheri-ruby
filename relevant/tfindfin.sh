#!/bin/bash

# Input: ./map_test_classes.sh testlog.txt

if [ $# -ne 1 ]; then
    echo "Usage: $0 testlog.txt"
    exit 1
fi

if [ ! -d "../test" ]; then
    echo "Error: ../test directory not found"
    exit 1
fi

testlog="$1"
declare -A file_to_classes
declare -A class_to_file
declare -A passed_files

# 1. Build file → class and class → file maps
while IFS= read -r file; do
  matches=$(grep -E '^[[:space:]]*class[[:space:]]+[A-Za-z0-9_:]+[[:space:]]*<+[[:space:]]*Test::Unit::TestCase' "$file")
  if [[ -n "$matches" ]]; then
    # echo "$matches"
    while IFS= read -r line; do
      class_name=$(echo "$line" | sed -E 's/^[[:space:]]*class[[:space:]]+([A-Za-z0-9_:]+)[[:space:]]*<.*/\1/')
	#   echo "$line, $class_name"
      file_to_classes["$file"]+="$class_name "
      class_to_file["$class_name"]="$file"
    done <<< "$matches"
  fi
done < <(find ../test -type f -name "*.rb")

# 2. Process the test log and extract class names
while IFS= read -r line; do
  [[ "$line" =~ \]?[[:space:]]*([A-Za-z0-9_:]+)# ]] || continue
  class_path="${BASH_REMATCH[1]}"
  class=$(echo "$class_path" | sed -E 's/.*#.*::(.*)/\1/')
#   echo "Processing class: $class"
  file="${class_to_file[$class]}"
  [[ -n "$file" ]] && passed_files["$file"]=1
done < "$testlog"

# 3. Output passed files
# echo "Files with passed test classes:"
for file in "${!passed_files[@]}"; do
  echo "$file"
done






# #!/usr/bin/bash 

# # Usage: ./find_tests.sh testlog.txt

# if [ $# -ne 1 ] || [ ! -f "$1" ]; then
#     echo "Usage: $0 testlog.txt"
#     echo "Error: Please provide a valid input file"
#     exit 1
# fi

# input_file="$1"

# # Function to convert CamelCase to snake_case
# camel_to_snake() {
#     echo "$1" | sed 's/_//g' | sed -E 's/([A-Z])/_\L\1/g' | sed 's/^_//' 
# }

# while IFS= read -r line; do
#     # Extract the full class/method after '] '
#     [ -z "$line" ] && continue  # Skip empty lines
    
#     entry=$(echo "$line" | sed -n 's/.*] //p')
#     [ -z "$entry" ] && continue  # Skip lines without proper format
# 	# echo "$entry"

#     # Extract the class path and test name
#     class_and_test=$(echo "$entry" | cut -d'=' -f1 | tr -d ' ')
# 	# # echo "$class_and_test"

#     class_path=$(echo "$class_and_test" | cut -d'#' -f1 | sed 's/::/\//g' | sed 's/_//g' | sed -E 's/([A-Z])/_\L\1/g' | sed 's/^_//' )
#     echo "Class path: $class_path"
#     # test_name=$(echo "$class_and_test" | cut -d'#' -f2)
#     # has_quotes=$(echo "$test_name" | grep -q '"' && echo 1 || echo 0)
#     # echo "$class_path, $test_name, $has_quotes"

#     # # Extract the file name from the class path (between '#' and last '::')
#     # file_class=$(echo "$class_path" | sed -E 's/.*#.*::(.*)/\1/')

#     # # Convert class name to snake_case + .rb
#     # snake_file=$(camel_to_snake "$file_class").rb

#     # # Find matching file in ../test subdirectories
#     # file_found=$(find ../test -type f -name "$snake_file" 2>/dev/null | head -n 1)

#     # if [ -n "$file_found" ] && grep -q "$test_name" "$file_found"; then
#     #     echo "$file_found"
#     # else
#     #     echo "not found for the line: $line, class: $class_path, test: $test_name, file: $snake_file"
#     # fi
# done < "$input_file"
