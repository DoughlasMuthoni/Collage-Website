# fix_encoding.py

# Open as UTF-16 and convert to UTF-8
with open("all_data.json", "r", encoding="utf-16") as f_in:
    content = f_in.read()

with open("fixed_clean_data.json", "w", encoding="utf-8") as f_out:
    f_out.write(content)

print("Converted from UTF-16 to UTF-8 successfully.")
