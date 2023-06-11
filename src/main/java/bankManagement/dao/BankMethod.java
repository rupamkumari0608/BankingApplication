package bankManagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bankMangement.bean.Account;

public class BankMethod implements BankInterface{

	ArrayList<Account> allAccountsHdfc = new ArrayList<>();
	@Override
	public Boolean createAccount(Account account) {
		String sql="Insert into bank (accountId,amount,accountHolder,bankType) values (?,?,?,?);" ;
		try (
			Connection connection = BankDao.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setLong(1, account.getAccountID());
			preparedStatement.setDouble(2, account.getBalance());
			preparedStatement.setString(3, account.getAccountHolder());
			preparedStatement.setString(4, account.getBankType());
			
			System.out.println(account.getAccountHolder());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
	       e.printStackTrace();
		}	
		return true;
	}
	
	@Override
	public Boolean depositMoney(int id, double depositAmount,double oldAmount) {
		String sql="Update bank set amount = ? where id = ? ;" ;
		try (
			Connection connection = BankDao.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setDouble(1, depositAmount+oldAmount);
			preparedStatement.setInt(2, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
	       e.printStackTrace();
		}	
		return true;
	}

	@Override
	public Boolean withdrawMoney(int id, double withdrawalAmount,double oldAmount){
		String sql="Update bank set amount = ? where id = ? ;" ;
		try (
			Connection connection = BankDao.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
			preparedStatement.setDouble(1, oldAmount-withdrawalAmount);
			preparedStatement.setInt(2, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
	       e.printStackTrace();
		}	
		return true;
	}
	public static List<Account> selectAllUsers() {
		List<Account> users = new ArrayList<>();
		String sql="select * from bank ;" ;
		try (
			Connection connection = BankDao.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id=rs.getInt("id");
				int accountId = rs.getInt("accountId");
				String name = rs.getString("accountHolder");
				Double amount = rs.getDouble("amount");
				String bankType = rs.getString("bankType");
				users.add(new Account(id,name,bankType,accountId, amount));
			}
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		return users;
	}
	public static Account userDetails(int id) {
		Account users = null;
		String sql="select * from bank where id = ?;" ;
		try (
			Connection connection = BankDao.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);) {
			System.out.println(preparedStatement);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int accountId = rs.getInt("accountId");
				String name = rs.getString("accountHolder");
				Double amount = rs.getDouble("amount");
				String bankType = rs.getString("bankType");
				users = new Account(id,name,bankType,accountId, amount);
			}
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		return users;
		
	}
}
