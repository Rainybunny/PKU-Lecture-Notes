import sys
import re

def compare_floats(val1_str, val2_str, line_num, abs_tol=1e-4, rel_tol=1e-4):
    """Compare two floating-point numbers from strings with tolerance."""
    try:
        val1 = float(val1_str)
        val2 = float(val2_str)
    except ValueError:
        print(f"Error: Could not convert '{val1_str}' or '{val2_str}' to float on line {line_num}.")
        return False

    if abs(val1 - val2) <= abs_tol:
        return True
    
    # Avoid division by zero for relative error check
    max_abs = max(abs(val1), abs(val2))
    if max_abs > 1e-9:
        if abs(val1 - val2) / max_abs <= rel_tol:
            return True
            
    print(f"Mismatch on line {line_num}: {val1} vs {val2}")
    print(f"  Absolute error: {abs(val1 - val2)}")
    if max_abs > 1e-9:
        print(f"  Relative error: {abs(val1 - val2) / max_abs}")
    return False

def main():
    if len(sys.argv) != 3:
        print("Usage: python cmp.py <file1> <file2>")
        sys.exit(1)

    file1_path = sys.argv[1]
    file2_path = sys.argv[2]

    try:
        with open(file1_path, 'r') as f1, open(file2_path, 'r') as f2:
            lines1 = f1.readlines()
            lines2 = f2.readlines()
    except FileNotFoundError as e:
        print(f"Error: {e}")
        sys.exit(1)

    if len(lines1) != len(lines2):
        print(f"Files have different number of lines: {len(lines1)} vs {len(lines2)}")
        sys.exit(1)

    # Regex to find numbers (including integers and scientific notation)
    num_regex = r"[-+]?\d+(?:\.\d*)?(?:[eE][-+]?\d+)?"

    for i, (line1, line2) in enumerate(zip(lines1, lines2)):
        # Compare non-numeric parts of the line
        non_numeric1 = re.sub(num_regex, '', line1).strip()
        non_numeric2 = re.sub(num_regex, '', line2).strip()
        if non_numeric1 != non_numeric2:
            print(f"Header mismatch on line {i+1}: '{non_numeric1}' vs '{non_numeric2}'")
            sys.exit(1)

        # Compare numeric parts
        nums1 = re.findall(num_regex, line1)
        nums2 = re.findall(num_regex, line2)

        if len(nums1) != len(nums2):
            print(f"Different number of values on line {i+1}: {len(nums1)} vs {len(nums2)}")
            sys.exit(1)

        for v1_str, v2_str in zip(nums1, nums2):
            if not compare_floats(v1_str, v2_str, i + 1):
                sys.exit(1)

    print("Files are equivalent within tolerance.")
    sys.exit(0)

if __name__ == "__main__":
    main()
