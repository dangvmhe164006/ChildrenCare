/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.common;

/**
 *
 * @author THINH
 */
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
