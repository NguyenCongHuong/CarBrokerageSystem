package common;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	/**
	 * Ham chuyen doi dinh dang tien
	 * 
	 * @param money
	 * @return
	 */
	public static String formatCurrency(String money) {
		Double result = Double.parseDouble(money);
		DecimalFormat dFormat = new DecimalFormat("####,###,###");
		return dFormat.format(result);
	}
	
	/**
	 * Ham dinh dang lai ngay thang nam: dd/MM/yyyy
	 * 
	 * @param d
	 * @return
	 */
	public static String formatDateTime(String d) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = "";
		try {
			Date date = df.parse(d);
			df = new SimpleDateFormat("dd/MM/yyyy");
			newDate = df.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return newDate;
	}

	/**
	 * Kiem tra chuoi rong hay khong
	 * 
	 * @param s
	 * @return
	 */
	public static boolean notVaild(String s) {
		if (s == null || s.length() == 0)
			return true;
		return false;
	}
	
	/**
	 * Chuyen doi chuoi null va rong thanh "-"
	 * 
	 * @param s
	 * @return
	 */
	public static String convertNullString(String s) {
		if (s == null || s.length() == 0)
			return "-";
		return s;
	}

	/**
	 * Lay CAN ngay am lich theo nam
	 * 
	 * @param year
	 * @return
	 */
	public static int getYearCan(String year) {
		return (Integer.parseInt(year) + 6) % 10;
	}

	/**
	 * Lay CHI ngay am lich theo nam
	 * 
	 * @param year
	 * @return
	 */
	public static int getYearChi(String year) {
		return (Integer.parseInt(year) + 8) % 12;
	}

	/**
	 * Lay menh tuoi am lich theo nam
	 * 
	 * @param year
	 * @return
	 */
	public static int getFiveElements(String year) {

		int fiveElement = 0;

		switch (getYearCan(year)) {
		case 0:
		case 1:
			fiveElement = 1;
			break;
		case 2:
		case 3:
			fiveElement = 2;
			break;
		case 4:
		case 5:
			fiveElement = 3;
			break;
		case 6:
		case 7:
			fiveElement = 4;
			break;
		case 8:
		case 9:
			fiveElement = 5;
			break;
		}

		switch (getYearChi(year)) {
		case 0:
		case 1:
		case 6:
		case 7:
			fiveElement += 0;
			break;
		case 2:
		case 3:
		case 8:
		case 9:
			fiveElement += 1;
			break;
		case 4:
		case 5:
		case 10:
		case 11:
			fiveElement += 2;
			break;
		}

		return fiveElement - 1;
	}

	public static void main(String[] args) {
		String year = "" + 1994;
		System.out.println("Can chi: " + Constants.CAN[getYearCan(year)] + " " + Constants.CHI[getYearChi(year)]);
		System.out.println("Menh tuoi: " + Constants.FIVE_ELEMENTS[getFiveElements(year)]);
	}

}
