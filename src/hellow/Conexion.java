/**
 * 
 */
package hellow;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * @author cervantesac
 *
 */
public class Conexion implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String serverbd, userbd, passbd;

	ResultSet rs;
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSetMetaData rsmd;

	public Conexion() {
		this.serverbd = "jdbc:mariadb://localhost:puerto/eclipse";//colocar host
		this.userbd = "usuario";
		this.passbd = "contraseña";
	}

	public boolean abrirConexion() {
		try {
			try {

				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(this.serverbd, this.userbd, this.passbd);
				st = conn.createStatement();
				return true;

			} catch (ClassNotFoundException sqle) {
				System.out.println(sqle);
				return false;
			}
		} catch (SQLException sqle) {
			System.out.println(sqle);
			return false;
		}
	}

	public boolean cerrarConexion() {
		try {
			conn.close();
			st.close();
			return true;
		} catch (SQLException sqle) {
			return false;
		}
	}

	public String consultar(String query) throws JSONException {
		String message;
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject item = new JSONObject();

		try {
			rs = st.executeQuery(query);
			rsmd = rs.getMetaData();
			while (rs.next()) {
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					if (rs.getString(i) != null)
						item.put(rsmd.getColumnName(i), rs.getString(i));
				}
				array.put(item);
			}
			json.put("items", array);
			message = json.toString();
			rs.close();
		} catch (SQLException sqle) {
			message = "[]";
			System.out.println(sqle);
		}
		return message;
	}

}
