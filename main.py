import time, requests, os

NAPOLEON_SESSION = os.getenv("NAPOLEON_SESSION", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkaXNjb3JkX2lkIjoiNDM2NzYxMzU5MTI5MTE2NjcyIiwidXNlcm5hbWUiOiJhcnlhcmFtZGQiLCJhdmF0YXIiOiI3NDBiNDg1YjY0OTJhNzIxNzVkZTE5NTNjZGQ4NzUwNyIsImlhdCI6MTc4NzM3NDM0NCwiZXhwIjoxNzg3OTc5MTQ0fQ.PcDhuDpAYQfQIw_aizHiFBpFfO45fkZmLCu2Vj0hqKo")
HIPHUB_SESSION = os.getenv("HIPHUB_SESSION", "f1745290c607b177028704e6:48b3920ad0da4b5e69fe7bdb5125e3fb3c3beb605ade998115753818df679fb5d7c9a6befc2689e9bb78e860be22ad671a1b6b4ad2abe6d97c34426ae76bb0e8ed72600eefd6fc428112a1d05bb9424eef11b171b6623901e86ab4c1:5276cdca3c9a7b03ff5200459c721499")
NAPOLEON_KEY = "NPLN-5D9D-8C64-4"
HIPHUB_KEY = "HIPHUB-PREMIUM-FBF7-EA8B"

print("=== AUTO RESET WORKER 24 JAM ===")
print(f"Napoleon: {NAPOLEON_KEY}")
print(f"HipHub: {HIPHUB_KEY}")

while True:
    try:
        # Napoleon - brute force every 0.5s
        try:
            r = requests.post("https://napoleonn.net/api/user/reset_hwid",
                headers={"Authorization": f"Bearer {NAPOLEON_SESSION}", "Content-Type": "application/json"},
                json={"key_value": NAPOLEON_KEY}, timeout=10)
            if r.ok:
                print(f"[Napoleon] {r.json()}")
        except Exception as e:
            print(f"[Napoleon] {e}")

        # HipHub
        try:
            r = requests.post("https://hiphub.cloud/api/keys/reset-hwid",
                headers={"Cookie": f"session={HIPHUB_SESSION}", "Content-Type": "application/json", "Referer": "https://hiphub.cloud/dashboard"},
                json={"key": HIPHUB_KEY}, timeout=10)
            if r.ok:
                print(f"[HipHub] {r.json()}")
        except Exception as e:
            print(f"[HipHub] {e}")

    except Exception as e:
        print(f"Loop error: {e}")
    time.sleep(0.5)
