use dep::bignum::fields::U256::U256Params;
use dep::bignum::BigNum;

pub type U256 = BigNum<3, 257, U256Params>;

pub fn u256_mod(a: U256, b: U256) -> U256 {
    let (q, r) = a.udiv_mod(b);
    assert(q * b + r == a);
    r
}

pub fn u256_from_slice(limbs: [Field]) -> U256 {
    BigNum::from_slice(limbs)
}
