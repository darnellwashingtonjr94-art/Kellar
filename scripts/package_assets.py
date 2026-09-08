import shutil
import os

def package_distribution_bundle():
    print("[*] Packaging multi-platform assets...")
    output_dir = "./dist/bundle"
    os.makedirs(output_dir, exist_ok=True)
    
    # Copy configuration files and metadata
    shutil.copy("Cargo.toml", output_dir)
    print(f"[+] Distribution bundle successfully created in {output_dir}")

if __name__ == "__main__":
    package_distribution_bundle()
