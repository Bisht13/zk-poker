use utils::Card;

pub(crate) fn shuffle_deck(deck: [Card; 3], shuffle_order: [Field; 3]) -> [Card; 3] {
    let mut new_deck = deck;
    for i in 0..3 {
        new_deck[i] = deck[shuffle_order[i]];
    }
    new_deck
}
