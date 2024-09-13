import logging
import os
import re
import argparse

def _camel_to_snake(name):
    s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
    return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()


def convert_to_snake_case_with_special(name):
    # Special case for words starting with THORChain
    if name.startswith('THORChain'):
        return 'thorchain_' + _camel_to_snake(name[len('THORChain'):])
    
    return _camel_to_snake(name)


def process_file(file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        with open(file_path, 'w') as file:
            for line in lines:
                if line.strip().startswith(('import', 'export')):
                    match = re.search(r"'([^']*)'", line)
                    if match:
                        original_text = match.group(1)
                        snake_case_text = convert_to_snake_case_with_special(original_text)
                        line = line.replace(original_text, snake_case_text)
                file.write(line)
    except Exception as e:
        logging.error(f"Error processing file {file_path}: {e}")

def process_directory(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.dart'):
                process_file(os.path.join(root, file))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Process Dart files to convert import and export paths to snake_case.")
    parser.add_argument('directory', type=str,
                        help='The directory containing Dart files to process')
    args = parser.parse_args()

    process_directory(args.directory)
