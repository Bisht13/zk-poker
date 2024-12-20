use utils::{pow, p_1, g, Card};

fn decrypt_card(card: Card, priv_key: Field) -> Card {
    Card {
        value: card.value * pow(card.blinding_factor, p_1 - priv_key),
        blinding_factor: card.blinding_factor,
    }
}

#[recursive]
fn main(priv_key: Field, pub_key: pub Field, deck: pub [Card; 3]) -> pub [Card; 3] {
    assert(pub_key == pow(g, priv_key));

    let mut new_deck = deck;
    for i in 0..3 {
        new_deck[i] = decrypt_card(deck[i], priv_key);
    }
    new_deck
}
