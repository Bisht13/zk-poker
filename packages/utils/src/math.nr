pub fn pow(x: Field, y: Field) -> Field {
    let y_bytes: [u8; 32] = y.to_le_bytes();

    // Extract 32-bit parts: y7 is most significant, y0 is least significant
    let y_part_0: [u8; 4] = [y_bytes[0],  y_bytes[1],  y_bytes[2],  y_bytes[3]];
    let y_part_1: [u8; 4] = [y_bytes[4],  y_bytes[5],  y_bytes[6],  y_bytes[7]];
    let y_part_2: [u8; 4] = [y_bytes[8],  y_bytes[9],  y_bytes[10], y_bytes[11]];
    let y_part_3: [u8; 4] = [y_bytes[12], y_bytes[13], y_bytes[14], y_bytes[15]];
    let y_part_4: [u8; 4] = [y_bytes[16], y_bytes[17], y_bytes[18], y_bytes[19]];
    let y_part_5: [u8; 4] = [y_bytes[20], y_bytes[21], y_bytes[22], y_bytes[23]];
    let y_part_6: [u8; 4] = [y_bytes[24], y_bytes[25], y_bytes[26], y_bytes[27]];
    let y_part_7: [u8; 4] = [y_bytes[28], y_bytes[29], y_bytes[30], y_bytes[31]];

    let y0 = Field::from_le_bytes::<4>(y_part_0);
    let y1 = Field::from_le_bytes::<4>(y_part_1);
    let y2 = Field::from_le_bytes::<4>(y_part_2);
    let y3 = Field::from_le_bytes::<4>(y_part_3);
    let y4 = Field::from_le_bytes::<4>(y_part_4);
    let y5 = Field::from_le_bytes::<4>(y_part_5);
    let y6 = Field::from_le_bytes::<4>(y_part_6);
    let y7 = Field::from_le_bytes::<4>(y_part_7);

    // Start from the highest chunk: y7
    // x^y = x^(y7*2^(224) + y6*2^(192) + ... + y0)
    //
    // Procedure:
    // acc = x^(y7)
    // acc = (acc^(2^32)) * x^(y6)
    // acc = (acc^(2^32)) * x^(y5)
    // ...
    // acc = (acc^(2^32)) * x^(y0)

    let mut acc = x.pow_32(y7);          // acc = x^(y7)
    acc = shift_by_32(acc) * x.pow_32(y6); // acc = (x^(y7*2^32)) * x^(y6) = x^(y7*2^32 + y6)
    acc = shift_by_32(acc) * x.pow_32(y5); 
    acc = shift_by_32(acc) * x.pow_32(y4);
    acc = shift_by_32(acc) * x.pow_32(y3);
    acc = shift_by_32(acc) * x.pow_32(y2);
    acc = shift_by_32(acc) * x.pow_32(y1);
    acc = shift_by_32(acc) * x.pow_32(y0);

    acc
}

fn shift_by_32(mut val: Field) -> Field {
    // Raise val to (2^32) by squaring 32 times
    for _ in 0..32 {
        val = val * val;
    }
    val
}
