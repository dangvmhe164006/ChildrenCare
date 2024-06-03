
package vn.fpt.edu.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author THINH
 */
public class DateUtils {
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
    
    
}
