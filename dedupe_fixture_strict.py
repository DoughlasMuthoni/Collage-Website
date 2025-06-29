import json
from collections import defaultdict

input_file = "fixed_clean_data.json"
output_file = "deduped_data.json"

with open(input_file, "r", encoding="utf-8-sig") as f:
    data = json.load(f)

seen_usernames = set()
duplicates = defaultdict(list)
cleaned_data = []

for obj in data:
    if obj.get("model") == "auth.user":  # or your custom user model name
        username = obj["fields"].get("username")
        if username:
            if username in seen_usernames:
                duplicates[username].append(obj)
                continue  # skip duplicate
            seen_usernames.add(username)
    cleaned_data.append(obj)

# Save cleaned fixture
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(cleaned_data, f, indent=2)

# Show report
print(f"✅ Saved cleaned fixture to {output_file}")
if duplicates:
    print("⚠️  Found duplicates for these usernames:")
    for username, items in duplicates.items():
        print(f" - {username}: {len(items)} extra entries removed")
else:
    print("✅ No duplicates found in usernames.")
