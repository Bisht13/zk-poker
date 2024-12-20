use utils::{g, pow};

fn main(priv_key: Field) -> pub Field {
    pow(g, priv_key)
}
