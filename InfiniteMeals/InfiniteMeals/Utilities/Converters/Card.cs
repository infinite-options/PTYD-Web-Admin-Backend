using InfiniteMeals.Converters;
using System;
using System.Collections.Generic;
using System.Text;

namespace InfiniteMeals.Utilities.Converters {

    // card class that contains information about the number, CVV, and card type
    class Card {
        private long cardNumber;
        private long CVV;
        private CardType cardType;


        public Card(int cardNumber, int CVV, CardType cardType) {
            this.cardNumber = cardNumber;
            this.CVV = CVV;
            this.cardType = cardType;
        }

        // no params ctor
        public Card() {
            this.cardNumber = 0;
            this.CVV = 0;
            this.cardType = CardType.Invalid;
        }


    }
}
