pub mod bignum;
pub mod math;

pub use math::pow;
pub use bignum::{U256, u256_from_slice, u256_mod};

pub global p_1 = 21888242871839275222246405745257275088548364400416034343698204186575808495616;
pub global g = 2;

pub struct Card {
    pub blinding_factor: Field,
    pub value: Field,
}

pub fn split_field_into_three(field: Field) -> [Field] {
    let field_bytes: [u8; 32] = field.to_le_bytes();

    let part_0: [u8; 15] = [
        field_bytes[0],
        field_bytes[1],
        field_bytes[2],
        field_bytes[3],
        field_bytes[4],
        field_bytes[5],
        field_bytes[6],
        field_bytes[7],
        field_bytes[8],
        field_bytes[9],
        field_bytes[10],
        field_bytes[11],
        field_bytes[12],
        field_bytes[13],
        field_bytes[14],
    ];
    let part_1: [u8; 15] = [
        field_bytes[15],
        field_bytes[16],
        field_bytes[17],
        field_bytes[18],
        field_bytes[19],
        field_bytes[20],
        field_bytes[21],
        field_bytes[22],
        field_bytes[23],
        field_bytes[24],
        field_bytes[25],
        field_bytes[26],
        field_bytes[27],
        field_bytes[28],
        field_bytes[29],
    ];
    let part_2: [u8; 2] = [field_bytes[30], field_bytes[31]];

    let part_0 = Field::from_le_bytes::<15>(part_0);
    let part_1 = Field::from_le_bytes::<15>(part_1);
    let part_2 = Field::from_le_bytes::<2>(part_2);

    [part_0, part_1, part_2]
}
