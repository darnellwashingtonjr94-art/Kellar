pub struct ConsensusSyncEngine {
    validator_set_size: usize,
    epoch: u64,
}

impl ConsensusSyncEngine {
    pub fn new(size: usize) -> Self {
        Self {
            validator_set_size: size,
            epoch: 0,
        }
    }

    pub fn broadcast_block_proposal(&mut self, block_hash: &str) {
        self.epoch += 1;
        println!("[Epoch {}] Broadcasting block proposal {} to {} validators.", self.epoch, block_hash, self.validator_set_size);
    }
}
