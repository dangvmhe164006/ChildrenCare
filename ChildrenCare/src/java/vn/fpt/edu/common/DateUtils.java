
package vn.fpt.edu.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    // Checks if a string is a valid date in the specified format
    public static boolean isValidDate(String dateStr, String dateFormat) {
        if (dateStr == null || dateFormat == null) {
            return false;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        sdf.setLenient(false);
        try {
            sdf.parse(dateStr);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

    // Parses a string to a Date object in the specified format
    public static Date parseDate(String dateStr, String dateFormat) {
        if (dateStr == null || dateFormat == null) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        try {
            return sdf.parse(dateStr);
        } catch (ParseException e) {
            return null;
        }
    }
}
