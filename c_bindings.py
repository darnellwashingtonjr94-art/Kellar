import ctypes
import os

# Load C shared library
lib_path = os.path.abspath("./libkellar.so")
if os.path.exists(lib_path):
    kellar_lib = ctypes.CDLL(lib_path)
    print("[+] Loaded C Native Shared Library.")
else:
    print("[!] Shared library libkellar.so not found.")
