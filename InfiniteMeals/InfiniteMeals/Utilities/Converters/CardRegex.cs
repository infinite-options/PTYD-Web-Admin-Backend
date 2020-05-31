using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace InfiniteMeals.Utilities.Converters {

    // class to hold information about a card's regex and type
    class CardRegex {

        public Regex cardNumberRegex;
        public CardType cardType;

        public CardRegex(Regex cardNumberRegex, CardType cardType) {
            this.cardNumberRegex = cardNumberRegex;
            this.cardType = cardType;
        }
    }
}
