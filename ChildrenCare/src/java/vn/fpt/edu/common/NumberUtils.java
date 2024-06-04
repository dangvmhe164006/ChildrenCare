package vn.fpt.edu.common;

public class NumberUtils {

    // Checks if a string is a valid integer
    public static boolean isValidInteger(String str) {
        if (str == null) {
            return false;
        }
        try {
            Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    // Checks if a string is a valid double
    public static boolean isValidDouble(String str) {
        if (str == null) {
            return false;
        }
        try {
            Double.parseDouble(str);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }
}
