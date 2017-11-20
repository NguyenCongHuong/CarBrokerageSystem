package common;

public class Constants {

	public static final String HOST_NAME = "localhost";
	public static final String SQL_INSTANCE_NAME = "MSSQLSERVER";
	public static final String DATABASE = "CarBrokerageSystem";
	public static final String USERNAME = "sa";
	public static final String PASSWORD = "12345678";
	public static final String PORT = "8047";

	/**
	 * Chuoi ket noi bang jtds co ten dang nhap va mat khau
	 */
	// public static final String LIBRARY_NAME = "net.sourceforge.jtds.jdbc.Driver";
	// public static final String URL_CONNECTION = "jdbc:jtds:sqlserver://" +
	// HOST_NAME + ":" + PORT + "/" + DATABASE
	// + ";instance=" + SQL_INSTANCE_NAME;

	/**
	 * Chuoi ket noi bang jdbc khong co ten dang nhap va mat khau
	 */
	// public static final String LIBRARY_NAME =
	// "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	// public static final String URL_CONNECTION =
	// "jdbc:sqlserver://localhost:"+PORT+";databaseName="+DATABASE+";integratedSecurity=True";

	/**
	 * Chuoi ket noi bang jdbc co ten dang nhap va mat khau
	 */
	public static final String LIBRARY_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	public static final String URL_CONNECTION = "jdbc:sqlserver://localhost:" + PORT + ";databaseName=" + DATABASE;

	/**
	 * Chuoi link upload anh
	 */
	public static final String LINK_SHOW_IMG = "images/Car/";
	public static final String LINK_UPLOAD_IMG = "E:\\Git clone\\CarBrokerageSystem\\CarBrokerageSystem\\WebContent\\";

	/**
	 * Chuoi thong bao
	 */
	public static String MSG_LOGIN_FAILED = "Tên hoặc mật khẩu không chính xác!";
	public static String MSG_ADD_PRODUCER = "Thêm một hãng xe thành công!";
	public static String MSG_ADD_PRODUCER_FAIL = "Tên hãng xe đã tồn tại!";
	public static String MSG_ADD_STYLE = "Thêm phong cách xe thành công!";
	public static String MSG_ADD_STYLE_FAIL = "Tên phong cách xe đã tồn tại!";

	/**
	 * Loai tien
	 */
	public static String CURRENCY = "VND";

	/**
	 * Chuoi CAN, CHI theo nam
	 */
	public static final String CAN[] = { "Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ", "Canh", "Tân", "Nhâm", "Quý" };
	public static final String CHI[] = { "Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi", "Thân", "Dậu", "Tuất",
			"Hợi" };
	public static final String FIVE_ELEMENTS[] = { "Kim", "Thủy", "Hỏa", "Thổ", "Mộc" };

	/**
	 * Loai quyen dang nhap
	 */
	public static final String ADMIN = "0";
	public static final String USER = "1";
}
