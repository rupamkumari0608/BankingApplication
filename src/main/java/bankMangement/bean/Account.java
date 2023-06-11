package bankMangement.bean;

public class Account {
	private  int id;
	private  int accountID;
	private  double balance;
	private  String accountHolder;
	private  String bankType;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public  int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	
	public  double getBalance() {
		return balance;
	}
	
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public  String getAccountHolder() {
		return accountHolder;
	}
	
	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}
	public String getBankType() {
		return bankType;
	}

	public  void setBankType(String bankType) {
		this.bankType = bankType;
	}
	//constructor
	public Account(int id, String accountHolder,String bankType,int accountID, double balance) {
		super();
		this.id= id;
		this.accountID = accountID;
		this.balance = balance;
		this.accountHolder = accountHolder;
		this.bankType  = bankType;
	}

	
}
