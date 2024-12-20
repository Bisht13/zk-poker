mod shuffle;

use utils::{pow, Card};
use shuffle::shuffle_deck;

fn mask_card(card: Card, rand: Field, shared_pub_key: Field) -> Card {
    let g = 2;
    let c1 = card.blinding_factor * pow(g, rand);
    let c2 = card.value * pow(shared_pub_key, rand);
    Card { blinding_factor: c1, value: c2 }
}

fn main(
    deck: pub [Card; 3],
    rand: [Field; 3],
    shuffle_order: [Field; 3],
    pub_key: pub Field,
) -> pub [Card; 3] {
    let mut new_deck = deck;
    for i in 0..3 {
        new_deck[i] = mask_card(deck[i], rand[i], pub_key);
    }

    shuffle_deck(new_deck, shuffle_order)
}
