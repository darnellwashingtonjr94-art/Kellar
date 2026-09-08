pub struct ZeroCopyBuffer<'a> {
    data: &'a [u8],
}

impl<'a> ZeroCopyBuffer<'a> {
    pub fn new(data: &'a [u8]) -> Self {
        Self { data }
    }

    pub fn parse_header(&self) -> Option<(u16, u16)> {
        if self.data.len() < 4 {
            return None;
        }
        let src_port = u16::from_be_bytes([self.data[0], self.data[1]]);
        let dst_port = u16::from_be_bytes([self.data[2], self.data[3]]);
        Some((src_port, dst_port))
    }
}
