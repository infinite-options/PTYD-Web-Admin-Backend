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

        // TODO: check regex, some test cases do not work
        public static CardRegex[] cardNumberMatches = { 
            new CardRegex(new Regex(@"^4[0-9]{6,}$"), CardType.Visa),
            new CardRegex(new Regex(@"^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$"), CardType.MasterCard),
            new CardRegex(new Regex(@"^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"), CardType.Diners),
            new CardRegex(new Regex(@"^6(?:011|5[0-9]{2})[0-9]{3,}$"), CardType.Discover),
            new CardRegex(new Regex(@"^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"), CardType.JCB),
            new CardRegex(new Regex(@"^3[47][0-9]{5,}$"), CardType.Amex)
};

        // validates a card number
        public static CardType validateCard(long? cardNumber) {

            String cardNumberAsString = cardNumber.ToString(); // convert to string to compare

            if (cardNumber == null) { // parameter is empty
                return CardType.Unknown; ;
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
