
package vn.fpt.edu.common;

import java.util.regex.Pattern;

public class PhoneNumberUtils {
    // Validates if the string is a valid phone number
    public static boolean isValidPhoneNumber(String phoneNumber) {
        if (phoneNumber == null) {
            return false;
        }
        // Phone number pattern
        String phoneNumberRegex = "^(\\+84|0)(3[2-9]|5[6|8|9]|7[0|6-9]|8[1-5]|9[0-4|6-9])[0-9]{7}$";
        return Pattern.matches(phoneNumberRegex, phoneNumber);
    }
}
