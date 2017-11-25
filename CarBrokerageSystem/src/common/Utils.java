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

		if (fiveElement > 5)
			return fiveElement - 6;
		return fiveElement - 1;
	}

	public static String getInformation(String birthday, String year) {
		int fiveElement = getFiveElements(year);
		String info = "<p><strong>I. Mệnh theo ngũ hành:</strong></p>" + "<p>" + "&nbsp;&nbsp;&nbsp;" + "Bạn sinh vào "
				+ birthday + " dương lịch, tức vào năm " + Constants.CAN[getYearCan(year)] + " "
				+ Constants.CHI[getYearChi(year)] + " âm lịch. " + "Đây là năm sinh của những người mang mệnh "
				+ Constants.FIVE_ELEMENTS_VI[fiveElement] + "." + "</p> ";
		switch (fiveElement) {
		case 0:
			info += "";
			break;
		case 1:
			break;
		case 2:
			info += "&lt;p&gt;" + "&nbsp;&nbsp;&nbsp;"
					+ "Hỏa là chỉ mùa hè, lửa và sức nóng. Có thể đem lại ánh sáng, hơi ấm và hạnh phúc, hoặc có thể tuôn trào, bùng nổ và sự bạo tàn. Ở khía cạnh tích cực. Hỏa tiêu biểu cho danh dự và sự công bằng. Ở khía cạnh tiêu cực. Hỏa tượng trưng cho tính gây hấn và chiến tranh."
					+ "&lt;/p&gt" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Người mệnh Hỏa yêu thích hành động và thường nắm vai trò lãnh đạo. Họ lôi kéo người khác, thường là vào rắc rối, vì họ không ưa luật lệ và bất chấp hậu quả."
					+ "</p>" + "<p><strong>II. Quy luật ngũ hành:</strong></p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Theo ngũ hành tương sinh thì: Hỏa sinh Thổ, Thổ sinh Kim, Kim sinh Thủy, Thủy sinh Mộc, Mộc sinh Hỏa. Theo ngũ hành tương khắc: Mộc Khắc Thổ, Thổ khắc Thủy, Thủy khắc Hỏa, Hỏa khắc Kim, Kim khắc Mộc."
					+ "</p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Ngũ hành mạng cũng có nhiều loại, nên khi dùng màu của Mạng trùng với màu của Hành thì phải cân nhắc cẩn thận vì \"lưỡng\" hành là con dao hai lưỡi, tùy theo mạng mà đôi khi tốt, đôi khi lại xấu. Thí dụ: Lưỡng Kim thành khí, tức là tốt chỉ cho những người mạng kim nguyên thủy chưa chế biến như: Hải Trung Kim, Sa Trung Kim, Bạch Lạp Kim. Các mạng Kim khác thì lại hóa ra \"lưỡng kim, kim khuyết\" tức là hai kim khí chạm nhau có thể gây sứt mẻ, hư hại cho nhau. Cho nên nếu không biết chắc chắn thì tránh mặc, đeo, mang những màu cùng Mạng của mình!"
					+ "</p>" + "<p><strong>III. Màu sắc mệnh Hỏa nên dùng:</strong></p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Màu Được tương sinh người mệnh hỏa là dùng màu Xanh lá cây." + "</p>" + "<p>"
					+ "&nbsp;&nbsp;&nbsp;" + "Màu Được hòa hợp với người mệnh hỏa là dùng màu Đỏ, Cam, Hồng, Tím."
					+ "</p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Màu Chế khắc được, ví dụ Hỏa chế khắc được Kim, có thể dung màu như màu Trắng, Vàng." + "</p>"
					+ "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Người mạng Hỏa nên dùng màu tương sinh, hành Mộc tức là xanh lá cây. Vì Gỗ khi cháy sẽ thành ngọn Lửa, nghĩa là Mộc sẽ sinh Hỏa, sẽ rất tốt."
					+ "</p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Cũng có thể dùng màu mạng Kim như vàng, trắng vì chỉ có lửa mới khống chế, nấu chảy được kim thành chất loảng mà thôi. Những màu Kim rất thích hợp cho những người mạng Hỏa thường hay bị stress."
					+ "</p>" + "<p>" + "&nbsp;&nbsp;&nbsp;"
					+ "Có thể dùng màu tương hợp đỏ, hồng, cam nhưng phải cẩn thận, \"lưỡng hỏa thành viên\" tức là trở thành trọn vẹn, đầy đủ, thành tựu. Nhưng quá nhiều năng lượng thì hóa ra nóng nảy, dễ gây stress, nóng tánh, lên máu, sinh mụn nhọt, lở loét, đau bao tử. Ngoài ra nên đề phòng mạng Hỏa hợp màu hành Hỏa sinh ra \"lưỡng hỏa, hỏa diệt\" tức bị tàn lụi, thất bại."
					+ "</p>";
			break;
		case 3:
			break;
		case 4:
			break;
		}
		return info;
	}

	public static void main(String[] args) {
		String year = "" + 1994;
		System.out.println("Can chi: " + Constants.CAN[getYearCan(year)] + " " + Constants.CHI[getYearChi(year)]);
		System.out.println("Menh tuoi: " + Constants.FIVE_ELEMENTS_VI[getFiveElements(year)]);
	}

}
