using Amazon.DynamoDBv2.Model.Internal.MarshallTransformations;
using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.RegularExpressions;

namespace InfiniteMeals.Utilities.Converters {

    // utility class to parse credit card numbers
   
    static class CardParser {
        // array of supported cards with regex and types
        // supported: visa, mastercard, diners, discover, jcb, & amex
 
        public static CardRegex[] cardNumberMatches = { 
            new CardRegex(new Regex(@"^4[0-9]{12}(?:[0-9]{3})?$"), CardType.Visa),
            new CardRegex(new Regex(@"^(5[1-5][0-9]{14}|2(22[1-9][0-9]{12}|2[3-9][0-9]{13}|[3-6][0-9]{14}|7[0-1][0-9]{13}|720[0-9]{12}))$"), CardType.MasterCard),
            new CardRegex(new Regex(@"^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"), CardType.Diners),
            new CardRegex(new Regex(@"^6(?:011|5[0-9]{2})[0-9]{3,}$"), CardType.Discover),
            new CardRegex(new Regex(@"^(?:2131|1800|35\d{3})\d{11}$"), CardType.JCB),
            new CardRegex(new Regex(@"^3[47][0-9]{13}$"), CardType.Amex)
};

        // validates a card number
        public static CardType validateCard(long? cardNumber) {

            String cardNumberAsString = cardNumber.ToString(); // convert to string to compare

            if (cardNumber == null) { // parameter is empty
                return CardType.Unknown; 
            }
            else { // check for a match 
                foreach (CardRegex cardRegex in cardNumberMatches) {
                    if (cardRegex.cardNumberRegex.IsMatch(cardNumberAsString)) {
                        return cardRegex.cardType; // return card type if match is found
                    }
                }
                return CardType.Unknown; // no matches found
            }

        }


    }
}
