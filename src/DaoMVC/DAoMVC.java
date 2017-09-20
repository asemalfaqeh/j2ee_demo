package DaoMVC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.PaymentBean;

public class DAoMVC {

	private Connection conn;
	
	public DAoMVC(Connection con){
		this.conn = con;
	}
	
	public int AddPayment(PaymentBean paymentBean) throws SQLException{
		int i = 0;
		String sql = "insert into payment(date,amount,product,pay,quantity,nameseller) values(?,?,?,?,?,?)";
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1,paymentBean.getDate());
		pre.setString(2,paymentBean.getAmount());
		pre.setString(3,paymentBean.getProduct());
		pre.setString(4, paymentBean.getPay());
		pre.setString(5,paymentBean.getQuantity());
		pre.setString(6, paymentBean.getNameseller());
		i = pre.executeUpdate();
		return i;
	}
	
}
