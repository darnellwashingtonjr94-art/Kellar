import { ethers } from "hardhat";

async function main() {
  const KellarAsset = await ethers.getContractFactory("KellarAsset");
  console.log("[*] Deploying KellarAsset contract to network...");
  
  const asset = await KellarAsset.deploy();
  await asset.waitForDeployment();

  console.log(`[+] KellarAsset deployed to: ${await asset.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
