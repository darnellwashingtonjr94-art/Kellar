use sha3::{Digest, Sha3_256};

pub fn verify_resource_proof(payload: &[u8], target_difficulty: usize) -> bool {
    let mut hasher = Sha3_256::new();
    hasher.update(payload);
    let result = hasher.finalize();
    
    // Check leading zero bits against difficulty
    let mut zero_count = 0;
    for byte in result.iter() {
        if *byte == 0 {
            zero_count += 8;
        } else {
            zero_count += byte.leading_zeros() as usize;
            break;
        }
    }
    
    zero_count >= target_difficulty
}
